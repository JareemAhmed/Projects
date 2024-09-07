//
//  HomeVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/21/24.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

class HomeVC: UIViewController {

    @IBOutlet weak var totalReffils: UIButton!
    @IBOutlet weak var totalServicesButton: UIButton!
    @IBOutlet weak var totalQtyDespenedButton: UIButton!
    @IBOutlet weak var totalordersDeliveredButton: UIButton!
    @IBOutlet weak var previewOrderView: UIView!
    @IBOutlet weak var statisticsLabel: UILabel!
    @IBOutlet weak var previousOrderSelectionButton: UIButton!
    @IBOutlet weak var previousOrderLabel: UILabel!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var previousBillLabel: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    
    let db = Firestore.firestore()
    let sender = Auth.auth().currentUser?.email
    let documentID = "UserData"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrievePhots()
        updateUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDeliveryHistory()
        loadData()
    }
    
    @IBAction func previousOrderSelectionButtonPressed(_ sender: UIButton) {
    }
    @IBAction func totalOrderbuttonClicked(_ sender: UIButton) {
    }
    @IBAction func totalQtyDispenedButtonClicked(_ sender: UIButton) {
    }
    @IBAction func totalServicesButtonClicked(_ sender: UIButton) {
    }
    @IBAction func totalRefillsButtonClicked(_ sender: UIButton) {
    }
}
//MARK: ~ Firebase data save and retrieving
extension HomeVC {
    
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
                    if let prevBill = data["Bill"] as? Int, let prevDeliveryAddress = data["Address"] as? String{
                        DispatchQueue.main.async {
                            self.previousBillLabel.text = String(prevBill)
                            self.previousOrderLabel.text = "Address : \(prevDeliveryAddress)"
                        }
                    }
                }
            }
        }
    }
    
    func loadData() {
        db.collection(sender!).getDocuments { querySnapshot, error in
            if let e = error {
                print("Profile\(e.localizedDescription)")
            } else {
                if let snapshotDocument = querySnapshot?.documents {
                    for doc in snapshotDocument {
                        let dataa = doc.data()
                        if let totalFuelQty = dataa["totalFuelQty"] as? Int, let totalRefil = dataa["totalRefills"] as? Int, let totalOrders = dataa["TotalOrders"] as? Int, let totalServices = dataa["TotalServices"] as? Int
                        {
                            DispatchQueue.main.async {
                                self.totalQtyDespenedButton.setTitle(" Total Qty\n Dispened\n\(totalFuelQty) Literes", for: .normal)
                                self.totalReffils.setTitle("Total Refills\n\n\t\(totalRefil)", for: .normal)
                                self.totalordersDeliveredButton.setTitle("Total orders\n Delivered\n\t\(totalOrders)", for: .normal)
                                self.totalServicesButton.setTitle("Total Services\n\t\(totalServices)", for: .normal)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func retrievePhots() {

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
                                self.UserImage.image = image
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
}
//MARK: ~ UI Implementation
extension HomeVC {
    func updateUI() {
        
        totalordersDeliveredButton.setTitle("Total orders\n Delivered\n\t0", for: .normal)
        totalQtyDespenedButton.setTitle(" Total Qty\n Dispened\n0.0 Literes", for: .normal)
        totalReffils.setTitle("Total Refills\n\n\t0", for: .normal)
        totalServicesButton.setTitle("Total Services\n\t0", for: .normal)
        
        totalReffils.layer.cornerRadius = 10.0
        totalReffils.layer.shadowColor = UIColor.black.cgColor
        totalReffils.layer.shadowOpacity = 0.5
        totalReffils.layer.shadowOffset = CGSize(width: 5, height: 5)
        totalReffils.layer.shadowRadius = 10

        totalServicesButton.layer.cornerRadius = 10.0
        totalServicesButton.layer.shadowColor = UIColor.black.cgColor
        totalServicesButton.layer.shadowOpacity = 0.5
        totalServicesButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        totalServicesButton.layer.shadowRadius = 10
        
        totalQtyDespenedButton.layer.cornerRadius = 10.0
        totalQtyDespenedButton.layer.shadowColor = UIColor.black.cgColor
        totalQtyDespenedButton.layer.shadowOpacity = 0.5
        totalQtyDespenedButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        totalQtyDespenedButton.layer.shadowRadius = 10
        
        totalordersDeliveredButton.layer.cornerRadius = 10.0
        totalordersDeliveredButton.layer.shadowColor = UIColor.black.cgColor
        totalordersDeliveredButton.layer.shadowOpacity = 0.5
        totalordersDeliveredButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        totalordersDeliveredButton.layer.shadowRadius = 10
        
        statisticsLabel.layer.cornerRadius = 10.0
        statisticsLabel.layer.shadowColor = UIColor.black.cgColor
        statisticsLabel.layer.shadowOpacity = 0.5
        statisticsLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        statisticsLabel.layer.shadowRadius = 10
        
        previousOrderSelectionButton.layer.borderColor = UIColor.black.cgColor
        previousOrderSelectionButton.layer.borderWidth = 2.0
        previousOrderSelectionButton.layer.cornerRadius = 10.0
        previousOrderSelectionButton.layer.shadowColor = UIColor.black.cgColor
        previousOrderSelectionButton.layer.shadowOpacity = 0.5
        previousOrderSelectionButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        previousOrderSelectionButton.layer.shadowRadius = 10

        appNameLabel.layer.cornerRadius = 10.0
        appNameLabel.layer.shadowColor = UIColor.black.cgColor
        appNameLabel.layer.shadowOpacity = 0.5
        appNameLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        appNameLabel.layer.shadowRadius = 10
        
        UserImage.layer.shadowColor = UIColor.black.cgColor
        UserImage.layer.shadowOpacity = 0.5
        UserImage.layer.shadowOffset = CGSize(width: 5, height: 5)
        UserImage.layer.shadowRadius = 10
        UserImage.layer.cornerRadius = UserImage.frame.size.width/2.0
        
        previewOrderView.layer.borderColor = UIColor.black.cgColor
        previewOrderView.layer.borderWidth = 2.0
        previewOrderView.layer.cornerRadius = 10.0
        previewOrderView.layer.shadowColor = UIColor.black.cgColor
        previewOrderView.layer.shadowOpacity = 0.5
        previewOrderView.layer.shadowOffset = CGSize(width: 5, height: 5)
        previewOrderView.layer.shadowRadius = 10
        previewOrderView.layer.masksToBounds = true

    }
}
