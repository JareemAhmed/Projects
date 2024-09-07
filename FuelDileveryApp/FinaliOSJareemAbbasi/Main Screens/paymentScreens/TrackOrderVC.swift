//
//  TrackOrderVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/26/24.
//

import UIKit
import MapKit
import CoreLocation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class TrackOrderVC: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let db = Firestore.firestore()
    let sender = Auth.auth().currentUser?.email
    let documentID = "UserData"
    var userLocationLatitude: CLLocationDegrees?
    var userLocationLongitude: CLLocationDegrees?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        loadDeliveryHistory()
        
    }
    
    func convertDictionaryToRegion(dict: [String: Any]) -> MKCoordinateRegion? {
        if let centerLatitude = dict["centerLatitude"] as? CLLocationDegrees,
           let centerLongitude = dict["centerLongitude"] as? CLLocationDegrees,
           let latitudeDelta = dict["latitudeDelta"] as? CLLocationDegrees,
           let longitudeDelta = dict["longitudeDelta"] as? CLLocationDegrees {
            
            let center = CLLocationCoordinate2D(latitude: centerLatitude, longitude: centerLongitude)
            let span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
            
            return MKCoordinateRegion(center: center, span: span)
        }
        return nil
    }
    
    func loadDeliveryHistory() {
        
        let deliveryHistoryID = "deliveryHistory"
        let deliveriesRef =  db.collection(sender!).document(documentID).collection(deliveryHistoryID)
        
        deliveriesRef.order(by: "createdAt", descending: true).limit(to: 1).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching last delivery: \(error.localizedDescription)")
                return
            }
            if let snapshot = snapshot?.documents {
                for doc in snapshot {
                    let data = doc.data()
                    if let userLocation = data["UserLocation"] {
                        if let region = self.convertDictionaryToRegion(dict: userLocation as! [String : Any]) {
                            let location = CLLocation(latitude: region.center.latitude, longitude: region.center.longitude)
                            self.render(location)
                        }
                    }
                }
            }
        }
    }
   
    func render(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Delivery address"
        mapView.addAnnotation(pin)
    }
    
    func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        if let error = error {
            print("Error in processResponse MapVC\(error)")
        } else {
            var location: CLLocation?
            if let placemarks = placemarks, placemarks.count > 0 {
                location = placemarks.first?.location
            }
            if let location = location {
                let coordinate = location.coordinate
                let request = MKDirections.Request()
                request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0), addressDictionary: nil))
                request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude), addressDictionary: nil))
                request.transportType = .any
                request.requestsAlternateRoutes = true

                let diretions = MKDirections(request: request)
                diretions.calculate { response, error in
                    print("error in finding route\(String(describing: error?.localizedDescription))")
                    guard let directionsResponse = response else {
                        return
                    }
                    for route in directionsResponse.routes {
                        self.mapView.addOverlay(route.polyline)
                        self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                    }
                }
                let pin = MKPointAnnotation()
                pin.coordinate = coordinate
                mapView.addAnnotation(pin)
            }
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: any MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = .blue
        renderer.lineWidth = 4.0
        renderer.alpha = 1.0
        return renderer
    }
}
