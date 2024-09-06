//
//  AddressVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/21/24.
//

import UIKit
import MapKit
import CoreLocation
import Firebase
import FirebaseStorage
import FirebaseAuth

class AddressVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dropoffLabel: UILabel!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let locationManager = CLLocationManager()
    var myGeoCoder = CLGeocoder()
    var performingReverseGeocoding = false
    var placemark: CLPlacemark?
    var lastGeocodingError: Error?
    let db = Firestore.firestore()
    let sender = Auth.auth().currentUser?.email
    var serviceSelected = ""
    var roadSideAssistanceSelected = ""
    let documentID = "UserData"
    var locationInPakistan = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        searchBar.delegate = self
        mapView.delegate = self
        locationManager.delegate = self
    }
    
    // MARK: - Navigation
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start { response, error in
            if let response = response {
                self.mapView.removeAnnotations(self.mapView.annotations)
                let latitude = response.boundingRegion.center.latitude
                let longitude = response.boundingRegion.center.longitude
                let location = CLLocation(latitude: latitude, longitude: longitude)
                self.render(location)
                self.reverseGeocode(location: location)
            } else {
                let alert = UIAlertController(title: "Location not found", message: "Please search again", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        savingData()
        if addressLabel.text != "" {
            performSegue(withIdentifier: "servicesSelected", sender: self)
        } else {
            let alert = UIAlertController(title: "Location not found", message: "Please enter your address", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func currentLocationButtonPressed(_ sender: UIButton) {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        if let location = locationManager.location {
            render(location)
            reverseGeocode(location: location)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
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
                if self.locationInPakistan == "true" {
                    self.addressLabel.text = address
                }
            }
        }
    }
    func render(_ location: CLLocation) {
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        if isLocationInPakistan(location: coordinate) == true {
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
            locationInPakistan = "true"

            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            pin.title = "Delivery address"
            mapView.addAnnotation(pin)
        
        } else {
            let alert = UIAlertController(title: "Service Unavailable", message: "This service is only available in Pakistan.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension AddressVC {
    
    func updateUI() {
        
        dropoffLabel.layer.borderColor = UIColor.black.cgColor
        dropoffLabel.layer.borderWidth = 2.0
        dropoffLabel.layer.cornerRadius = 10.0
        dropoffLabel.layer.shadowColor = UIColor.black.cgColor
        dropoffLabel.layer.shadowOpacity = 0.5
        dropoffLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        dropoffLabel.layer.shadowRadius = 10
        
        addressView.layer.cornerRadius = 10.0
        addressView.layer.shadowColor = UIColor.black.cgColor
        addressView.layer.shadowOpacity = 0.5
        addressView.layer.shadowOffset = CGSize(width: 5, height: 5)
        addressView.layer.shadowRadius = 10
        
    }
}
extension AddressVC: UITextFieldDelegate {
    
    func savingData() {
        if serviceSelected == "true" {
            let a = db.collection(sender!).document(documentID)
            a.updateData(["TotalServices": FieldValue.increment(Int64(1))
                         ])
        } else if roadSideAssistanceSelected == "true" {
            return
        } else {
            let a = db.collection(sender!).document(documentID)
            a.updateData(["TotalOrders": FieldValue.increment(Int64(1))
                         ])
        }
    }
    func isLocationInPakistan(location: CLLocationCoordinate2D) -> Bool {
        let latitude = location.latitude
        let longitude = location.longitude
        let maxLatitude: CLLocationDegrees = 37.0841
        let minLatitude: CLLocationDegrees = 23.6345
        let maxLongitude: CLLocationDegrees = 77.8375
        let minLongitude: CLLocationDegrees = 60.8728
        if latitude >= minLatitude && latitude <= maxLatitude &&
           longitude >= minLongitude && longitude <= maxLongitude {
            return true
        } else {
            locationInPakistan = "false"
            return false
        }
    }
    func showLocationServicesDenieddAler() {
        let alert = UIAlertController(title: "Location Servcies Disabled", message: "Please enable location services for this app in Settings", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
