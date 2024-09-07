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
            let documentID = "UserData"

            db.collection(sender!).document(documentID).getDocument { document, error in
                if let document = document, document.exists {
                    if let path = document["URL"] as? String {
                        let storageRef = Storage.storage().reference()
                        let fileRef = storageRef.child(path)
                        
                        fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                            if let error = error {
                                print("Error occurred: \(error.localizedDescription)")
                                if error.localizedDescription.contains("does not exist") {
                                    print("The specified file does not exist. Please check the path and try again.")
                                }
                            } else if let data = data, let image = UIImage(data: data) {
                                print("Image successfully retrieved.")
                                DispatchQueue.main.async {
                                    self.userPhoto.image = image
                                }
                            } else {
                                print("Failed to convert data to image.")
                            }
                        }
                    } else {
                        print("URL not found in document.")
                    }
                } else {
                    print("Document does not exist or there was an error: \(error?.localizedDescription ?? "Unknown error")")
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
            if CLLocationManager.locationServicesEnabled() {
                locationManager.startUpdatingLocation()
                let alert = UIAlertController(title: "Alert",
                                              message: "Location Services Enabled", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss",
                                              style: .cancel,
                                              handler: nil))
                self.present(alert, animated: true)
            } else {
                showLocationServicesAlert()
                sender.setOn(false, animated: true)
            }
        } else {
            locationManager.stopUpdatingLocation()
            let alert = UIAlertController(title: "Alert",
                                          message: "Location Services Disabled", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss",
                                          style: .cancel,
                                          handler: nil))
            self.present(alert, animated: true)
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
        print("Failed to find user's location: \(error)")
    }
}
