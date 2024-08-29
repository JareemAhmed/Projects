//
//  MapVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/14/24.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dropOffLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var myGeoCoder = CLGeocoder()
    var performingReverseGeocoding = false
    var placemark: CLPlacemark?
    var lastGeocodingError: Error?

    override func viewDidLoad() {
        super.viewDidLoad()
        UI()
        addressTextField.delegate = self
        mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.delegate = self
    }
    //MARK: ~ First Part
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("error in getting location\(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation = locations.last
        print("last location\(String(describing: newLocation))")
        
        if let location = locations.last {
            reverseGeocode(location: location)
            render(location)
        }
    }
    //MARK: GPT
    func reverseGeocode(location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Failed to reverse geocode location: \(error.localizedDescription)")
                return
            }

            if let placemark = placemarks?.first {
                let address = ("\(placemark.name ?? ""),\(placemark.locality ?? ""),\(placemark.administrativeArea ?? ""),\(placemark.postalCode ?? ""),\(placemark.country ?? "")")
                
                self.addressLabel.text = address
                print("Address: \(address)")
            }
        }
    }
    //MARK: END
    
    func render(_ location: CLLocation) {
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    
    //MARK: ~ third Part

    @IBAction func navigationButtonClicked(_ sender: UIButton) {
        
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        if authStatus == .notDetermined || authStatus == .restricted {
            showLocationServicesDenieddAler()
            return
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    //MARK: ~ second Part
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
      
        myGeoCoder.geocodeAddressString(addressTextField.text ?? "") { (placemark, error) in
            self.processResponse(withPlacemarks: placemark, error: error)
        }
    }
    
    func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        if let error = error {
            print("Error in processResponse MapVC\(error.localizedDescription)")
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
                pin.title = addressTextField.text
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
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "LocationSuccess", sender: self)
    }
}

extension MapVC: UITextFieldDelegate, MKMapViewDelegate {
    
    func UI() {
        dropOffLabel.layer.borderColor = UIColor.black.cgColor
        dropOffLabel.layer.borderWidth = 2.0
        dropOffLabel.layer.cornerRadius = 10.0
        dropOffLabel.layer.masksToBounds = true
        
        addressTextField.layer.borderColor = UIColor.black.cgColor
        addressTextField.layer.borderWidth = 2.0
        addressTextField.layer.cornerRadius = 10.0
    }
    
    func showLocationServicesDenieddAler() {
        let alert = UIAlertController(title: "Location Servcies Disabled", message: "Please enable location services for this app in Settings", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
