//
//  ProfileVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/10/24.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseStorage
import CoreLocation

class ProfileVC: UIViewController {
    
    @IBOutlet weak var switchLocation: UISwitch!
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var userPhoto: UIImageView!
    
    
    let locationManager = CLLocationManager()
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        UI()
        retrievePhots()
        loadData()
    }
    
    let sender = Auth.auth().currentUser?.email
    
    func loadData() {
        db.collection(sender!).getDocuments { querySnapshot, error in
            if let e = error {
                print("Profile\(e.localizedDescription)")
            } else {
                if let snapshotDocument = querySnapshot?.documents {
                    for doc in snapshotDocument {
                        let dataa = doc.data()
                        if let Name = dataa["name"] as? String, let phoneNumber = dataa["phoneNumber"] as? String, let email = dataa["email"] as? String
                        {
                            self.emailTextfield.text = email
                            self.nameTextField.text = Name
                            self.phoneNo.text = phoneNumber
                        }
                    }
                }
            }
        }
    }
    func retrievePhots() {
        db.collection(sender!).getDocuments { snapchot, error in
            if error == nil && snapchot != nil {
                var paths = [String]()
                for doc in snapchot!.documents {
                    paths.append(doc["URL"] as! String)
                }
                for path in paths {
                    let storageRef = Storage.storage().reference()
                    let fileRef = storageRef.child(path)
                    fileRef.getData(maxSize: 5 * 1024 * 1024) { result in
                        switch result {
                        case .success(let data):
                            if let image = UIImage(data: data) {
                                print("Image successfully retrieved.")
                                DispatchQueue.main.async {
                                    self.userPhoto.image = image
                                }
                            } else {
                                print("Failed to convert data to image.")
                            }
                        case .failure(let error):
                            print("Error occurred: \(error.localizedDescription)")
                            if error.localizedDescription.contains("does not exist") {
                                print("The specified file does not exist. Please check the path and try again.")
                            }
                        }
                    }
                }
            }
        }
    }
    
    func UI() {
        
        logoutButton.layer.borderColor = UIColor.black.cgColor
        logoutButton.layer.borderWidth = 2.0
        logoutButton.layer.cornerRadius = 10.0
        logoutButton.layer.shadowColor = UIColor.black.cgColor
        logoutButton.layer.shadowOpacity = 0.5
        logoutButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        logoutButton.layer.shadowRadius = 10
        
        userPhoto.layer.cornerRadius = userPhoto.frame.size.width/2.0
        
    }
    
    @IBAction func logoutButtonClicked(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
            self.navigationController?.popViewController(animated: true)
        } catch let signOutError as NSError {
            let alert = UIAlertController(title: "Woops", message: signOutError.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
}
extension ProfileVC: CLLocationManagerDelegate {
    
    @IBAction func swicthButtonClicked(_ sender: UISwitch) {
        locationSwitchChanged(sender)
    }
    @objc func locationSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            // Check if location services are enabled
            if CLLocationManager.locationServicesEnabled() {
                locationManager.startUpdatingLocation()
                print("Location Services Enabled")
            } else {
                // Prompt the user to enable Location Services
                showLocationServicesAlert()
                sender.setOn(false, animated: true) // revert switch to off
            }
        } else {
            locationManager.stopUpdatingLocation()
            print("Location Services Disabled")
        }
    }

    func showLocationServicesAlert() {
        let alert = UIAlertController(
            title: "Location Services Disabled",
            message: "Please enable location services in the Settings app.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        present(alert, animated: true, completion: nil)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print("User's location: \(location)")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }


}
