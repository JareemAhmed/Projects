//
//  PrevOrderVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/26/24.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

class PrevOrderVC: UIViewController {

    @IBOutlet weak var totalBillTitleLAbel: UILabel!
    @IBOutlet weak var fuelQtyTitleLabel: UILabel!
    @IBOutlet weak var addressTitleLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var fuelQtyLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var fuelCompanyTitleLabel: UILabel!
    @IBOutlet weak var fuelTypeTitleLabel: UILabel!
    @IBOutlet weak var fuelCompanyLabel: UILabel!
    @IBOutlet weak var fuelTypeLabel: UILabel!
    
    let db = Firestore.firestore()
    let sender = Auth.auth().currentUser?.email
    let documentID = "UserData"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDeliveryHistory()
        updateUI()
    }
   
     @IBAction func confirmButtonPressed(_ sender: UIButton) {
     performSegue(withIdentifier: "prevOrderConfirmed", sender: self)
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
                    if let totalBill = data["Bill"] as? Int, let prevDeliveryAddress = data["Address"] as? String, let fuelQuantity = data["fuelQuantity"] as? Int, let fuelType = data["fuelType"] as? String, let fuelCompany = data["FuelCompany"] as? String  {
                        self.billLabel.text = "PKR : \(String(totalBill))"
                        self.addressLabel.text = prevDeliveryAddress
                        self.fuelQtyLabel.text = "\(String(fuelQuantity)) Liters"
                        self.fuelTypeLabel.text = fuelType
                        self.fuelCompanyLabel.text = fuelCompany
                    }
                }
            }
        }
    }
    
    func updateUI() {
        
        confirmButton.layer.borderColor = UIColor.black.cgColor
        confirmButton.layer.borderWidth = 2.0
        confirmButton.layer.cornerRadius = 10.0
        confirmButton.layer.shadowColor = UIColor.black.cgColor
        confirmButton.layer.shadowOpacity = 0.5
        confirmButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        confirmButton.layer.shadowRadius = 10

        totalBillTitleLAbel.layer.cornerRadius = 10.0
        totalBillTitleLAbel.layer.shadowColor = UIColor.black.cgColor
        totalBillTitleLAbel.layer.shadowOpacity = 0.5
        totalBillTitleLAbel.layer.shadowOffset = CGSize(width: 5, height: 5)
        totalBillTitleLAbel.layer.shadowRadius = 10

        addressTitleLabel.layer.cornerRadius = 10.0
        addressTitleLabel.layer.shadowColor = UIColor.black.cgColor
        addressTitleLabel.layer.shadowOpacity = 0.5
        addressTitleLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        addressTitleLabel.layer.shadowRadius = 10
    
        fuelQtyTitleLabel.layer.cornerRadius = 10.0
        fuelQtyTitleLabel.layer.shadowColor = UIColor.black.cgColor
        fuelQtyTitleLabel.layer.shadowOpacity = 0.5
        fuelQtyTitleLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        fuelQtyTitleLabel.layer.shadowRadius = 10
        
        appNameLabel.layer.cornerRadius = 10.0
        appNameLabel.layer.shadowColor = UIColor.black.cgColor
        appNameLabel.layer.shadowOpacity = 0.5
        appNameLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        appNameLabel.layer.shadowRadius = 10
    }
}
