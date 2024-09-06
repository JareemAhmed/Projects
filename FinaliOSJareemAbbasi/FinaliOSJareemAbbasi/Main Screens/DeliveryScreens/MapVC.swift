//
//  MapVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/14/24.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController, CLLocationManagerDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dropOffLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let locationManager = CLLocationManager()
    var myGeoCoder = CLGeocoder()
    var performingReverseGeocoding = false
    var placemark: CLPlacemark?
    var lastGeocodingError: Error?
    var userLocation: MKCoordinateRegion?
    var locationInPakistan = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        UI()
        mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            
            let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = searchBar.text
            
            let activeSearch = MKLocalSearch(request: searchRequest)
            activeSearch.start { (response, error) in
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
    //MARK: ~ First Part
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let alert = UIAlertController(title: "Location not found", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
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
    //MARK: END
    
    func render(_ location: CLLocation) {
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        if isLocationInPakistan(location: coordinate) == true {
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            userLocation = region
            locationInPakistan = "true"
            mapView.setRegion(region, animated: true)
            
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
    func checkLocationAuthorization() {
            switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted, .denied:
                showLocationAccessDeniedAlert()
            case .authorizedWhenInUse, .authorizedAlways:
                locationManager.startUpdatingLocation()
            @unknown default:
                break
            }
        }
    func showLocationAccessDeniedAlert() {
        let alert = UIAlertController(title: "Location Access Denied",
                                      message: "Please enable location services in Settings to use this feature.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Open Settings", style: .default, handler: { _ in
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }

    //MARK: ~ third Part
    
    @IBAction func navigationButtonClicked(_ sender: UIButton) {
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        if let location = locationManager.location {
            reverseGeocode(location: location)
            render(location)
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        if addressLabel.text != "" {
            performSegue(withIdentifier: "LocationSuccess", sender: self)
        } else {
            let alert = UIAlertController(title: "Location not found", message: "Please enter your address", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LocationSuccess" {
            let controller = segue.destination as? FuelDetailsVC
            if let address = addressLabel.text {
                controller?.deliveryAddress = address
                controller?.userLocation = userLocation
            }
        }
    }
}

extension MapVC: UITextFieldDelegate, MKMapViewDelegate {
    
    func UI() {
        
        doneButton.tintColor = .systemBlue
        
        dropOffLabel.layer.borderColor = UIColor.black.cgColor
        dropOffLabel.layer.borderWidth = 2.0
        dropOffLabel.layer.cornerRadius = 10.0
        dropOffLabel.layer.masksToBounds = true
        
        addressView.layer.shadowColor = UIColor.black.cgColor
        addressView.layer.shadowOpacity = 0.5
        addressView.layer.shadowOffset = CGSize(width: 5, height: 5)
        addressView.layer.shadowRadius = 10
        
        addressView.layer.cornerRadius = 10.0
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
