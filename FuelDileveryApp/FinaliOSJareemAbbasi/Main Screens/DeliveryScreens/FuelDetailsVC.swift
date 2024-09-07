//
//  FuelDetailsVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/15/24.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth
import MapKit

class FuelDetailsVC: UIViewController {

    @IBOutlet weak var hascolButton: UIButton!
    @IBOutlet weak var attockButton: UIButton!
    @IBOutlet weak var totalButton: UIButton!
    @IBOutlet weak var shellButton: UIButton!
    @IBOutlet weak var psoButton: UIButton!
    @IBOutlet weak var dielselFuelButton: UIButton!
    @IBOutlet weak var superFuel: UIButton!
    @IBOutlet weak var specialFuel: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var patorlQuantityPicker: UIPickerView!
    
    var picker = pickerManager()
    let db = Firestore.firestore()
    let sender = Auth.auth().currentUser?.email
    let documentID = "UserData"
    let deliveryHistoryID = "deliveryHistory"
    var deliveryAddress = ""
    var userLocation: MKCoordinateRegion?
    var fuelQuantity = "0.0"
    var prevFuelQuantity = 0.0
    var fuelQuantityInLiters = 0.0
    var superFuelPrice = 200.0
    var specianFuelPrice = 250.0
    var dieselFuelPrice = 300.0
    var totalBillPrice = 0.0
    var specialFuel1 = false
    var superFuel1 = false
    var dieselFuel1 = false
    var fuelSelected = false
    var psoCompany = false
    var shellCompany = false
    var totalCompany = false
    var attoctCompany = false
    var hascolCompany = false
    var fuelCompanySelected = false
    var fuelType = ""
    var fuelCompany = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updatingFuelQty()
    }

    @IBAction func specialFuelButtonClicked(_ sender: UIButton) {
        
        specialFuel.isSelected = true
        if specialFuel.isSelected == true
        {
            specialFuel.layer.borderColor = UIColor.systemBlue.cgColor
            specialFuel.layer.borderWidth = 2.0
            dielselFuelButton.layer.borderColor = .none
            dielselFuelButton.layer.borderWidth = 0.0
            superFuel.layer.borderColor = .none
            superFuel.layer.borderWidth = 0.0
        }
        specialFuel1 = true
        fuelSelected = true

    }
    @IBAction func superFuelButtonClicked(_ sender: UIButton) {
        
        superFuel.isSelected = true
        if superFuel.isSelected == true {
            specialFuel.layer.borderColor = .none
            specialFuel.layer.borderWidth = 0.0
            dielselFuelButton.layer.borderColor = .none
            dielselFuelButton.layer.borderWidth = 0.0
            superFuel.layer.borderColor = UIColor.systemBlue.cgColor
            superFuel.layer.borderWidth = 2.0
        }
        superFuel1 = true
        fuelSelected = true

    }
    @IBAction func dieselButtonClicked(_ sender: UIButton) {
        dielselFuelButton.isSelected = true
        if dielselFuelButton.isSelected == true {
            dielselFuelButton.layer.borderColor = UIColor.systemBlue.cgColor
            dielselFuelButton.layer.borderWidth = 2.0
            specialFuel.layer.borderColor = .none
            specialFuel.layer.borderWidth = 0.0
            superFuel.layer.borderColor = .none
            superFuel.layer.borderWidth = 0.0
        }
        dieselFuel1 = true
        fuelSelected = true

    }
    @IBAction func PSOButtonClicked(_ sender: UIButton) {
        
        psoButton.isSelected = true
        if psoButton.isSelected == true  {
            psoButton.layer.borderColor = UIColor.systemBlue.cgColor
            psoButton.layer.borderWidth = 2.0
            shellButton.layer.borderColor = .none
            shellButton.layer.borderWidth = 0.0
            totalButton.layer.borderColor = .none
            totalButton.layer.borderWidth = 0.0
            attockButton.layer.borderColor = .none
            attockButton.layer.borderWidth = 0.0
            hascolButton.layer.borderColor = .none
            hascolButton.layer.borderWidth = 0.0
        }
        psoCompany = true
        fuelCompanySelected = true

    }
    @IBAction func shellButtonClicked(_ sender: UIButton) {
        
        shellButton.isSelected = true
        if shellButton.isSelected == true  {
            shellButton.layer.borderColor = UIColor.systemBlue.cgColor
            shellButton.layer.borderWidth = 2.0
            psoButton.layer.borderColor = .none
            psoButton.layer.borderWidth = 0.0
            totalButton.layer.borderColor = .none
            totalButton.layer.borderWidth = 0.0
            attockButton.layer.borderColor = .none
            attockButton.layer.borderWidth = 0.0
            hascolButton.layer.borderColor = .none
            hascolButton.layer.borderWidth = 0.0
        }
        shellCompany = true
        fuelCompanySelected = true

    }
    @IBAction func totalButtonClicked(_ sender: UIButton) {
        
        totalButton.isSelected = true
        if totalButton.isSelected == true  {
            totalButton.layer.borderColor = UIColor.systemBlue.cgColor
            totalButton.layer.borderWidth = 2.0
            shellButton.layer.borderColor = .none
            shellButton.layer.borderWidth = 0.0
            psoButton.layer.borderColor = .none
            psoButton.layer.borderWidth = 0.0
            attockButton.layer.borderColor = .none
            attockButton.layer.borderWidth = 0.0
            hascolButton.layer.borderColor = .none
            hascolButton.layer.borderWidth = 0.0
        }
        totalCompany = true
        fuelCompanySelected = true

    }
    @IBAction func attockButtonClicked(_ sender: UIButton) {
        
        attockButton.isSelected = true
        if attockButton.isSelected == true  {
            attockButton.layer.borderColor = UIColor.systemBlue.cgColor
            attockButton.layer.borderWidth = 2.0
            totalButton.layer.borderColor = .none
            totalButton.layer.borderWidth = 0.0
            shellButton.layer.borderColor = .none
            shellButton.layer.borderWidth = 0.0
            psoButton.layer.borderColor = .none
            psoButton.layer.borderWidth = 0.0
            hascolButton.layer.borderColor = .none
            hascolButton.layer.borderWidth = 0.0
        }
        attoctCompany = true
        fuelCompanySelected = true

    }
    @IBAction func hascolButtonClicked(_ sender: UIButton) {
        
        hascolButton.isSelected = true
        if hascolButton.isSelected == true  {
            totalButton.layer.borderColor = .none
            totalButton.layer.borderWidth = 0.0
            shellButton.layer.borderColor = .none
            shellButton.layer.borderWidth = 0.0
            psoButton.layer.borderColor = .none
            psoButton.layer.borderWidth = 0.0
            attockButton.layer.borderColor = .none
            attockButton.layer.borderWidth = 0.0
            hascolButton.layer.borderColor = UIColor.systemBlue.cgColor
            hascolButton.layer.borderWidth = 2.0
        }
        hascolCompany = true
        fuelCompanySelected = true

    }
    @IBAction func confirmButtonClicked(_ sender: UIButton) {
        
        savingData()
        savingDeliveryHistory()
        confirmButton.layer.borderColor = UIColor.systemBlue.cgColor
        if fuelSelected == true && fuelCompanySelected == true {
            performSegue(withIdentifier: "confirm", sender: self)
        }
    }
    
    func fuelSelection() {
        
        if psoCompany == true {
            fuelCompany = "PSO"
        } else if shellCompany == true {
            fuelCompany = "SHELL"
        } else if totalCompany == true {
            fuelCompany = "TOTAL"
        } else if attoctCompany == true {
            fuelCompany = "ATTOCT"
        } else if hascolCompany == true {
            fuelCompany = "HASCOL"
        }
        
        if specialFuel1 == true {
            fuelType = "SPECIAL"
        } else if superFuel1 == true {
            fuelType = "SUPER"
        } else if dieselFuel1 == true {
            fuelType = "DIESEL"
        }
    }
}
//MARK: ~ UI Implementation
extension FuelDetailsVC {
    
    func updateUI() {
        confirmButton.layer.borderColor = UIColor.black.cgColor
        confirmButton.layer.borderWidth = 2.0
        confirmButton.layer.cornerRadius = 10.0
        confirmButton.layer.shadowColor = UIColor.black.cgColor
        confirmButton.layer.shadowOpacity = 0.5
        confirmButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        confirmButton.layer.shadowRadius = 10
        
        hascolButton.layer.cornerRadius = 10.0
        hascolButton.layer.shadowColor = UIColor.black.cgColor
        hascolButton.layer.shadowOpacity = 0.5
        hascolButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        hascolButton.layer.shadowRadius = 10
        
        attockButton.layer.cornerRadius = 10.0
        attockButton.layer.shadowColor = UIColor.black.cgColor
        attockButton.layer.shadowOpacity = 0.5
        attockButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        attockButton.layer.shadowRadius = 10
        
        totalButton.layer.cornerRadius = 10.0
        totalButton.layer.shadowColor = UIColor.black.cgColor
        totalButton.layer.shadowOpacity = 0.5
        totalButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        totalButton.layer.shadowRadius = 10
        
        shellButton.layer.cornerRadius = 10.0
        shellButton.layer.shadowColor = UIColor.black.cgColor
        shellButton.layer.shadowOpacity = 0.5
        shellButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        shellButton.layer.shadowRadius = 10
        
        psoButton.layer.cornerRadius = 10.0
        psoButton.layer.shadowColor = UIColor.black.cgColor
        psoButton.layer.shadowOpacity = 0.5
        psoButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        psoButton.layer.shadowRadius = 10
        
        dielselFuelButton.layer.cornerRadius = 10.0
        dielselFuelButton.layer.shadowColor = UIColor.black.cgColor
        dielselFuelButton.layer.shadowOpacity = 0.5
        dielselFuelButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        dielselFuelButton.layer.shadowRadius = 10
        
        superFuel.layer.cornerRadius = 10.0
        superFuel.layer.shadowColor = UIColor.black.cgColor
        superFuel.layer.shadowOpacity = 0.5
        superFuel.layer.shadowOffset = CGSize(width: 5, height: 5)
        superFuel.layer.shadowRadius = 10
        
        specialFuel.layer.cornerRadius = 10.0
        specialFuel.layer.shadowColor = UIColor.black.cgColor
        specialFuel.layer.shadowOpacity = 0.5
        specialFuel.layer.shadowOffset = CGSize(width: 5, height: 5)
        specialFuel.layer.shadowRadius = 10
        
    }
}
//MARK: ~ PickerView Delegate and dataSource
extension FuelDetailsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker.fuelQuantity.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker.fuelQuantity[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fuelQuantity = picker.fuelQuantity[row]
        fuelQuantityInLiters = Double(fuelQuantity) ?? 0.0
        if specialFuel1 == true {
            totalBillPrice = (fuelQuantityInLiters * superFuelPrice) + 100
            totalBillLabel.text = String(totalBillPrice)
        } else if superFuel1 == true {
            totalBillPrice = (fuelQuantityInLiters * specianFuelPrice) + 100
            totalBillLabel.text = String(totalBillPrice)
        } else if dieselFuel1 == true {
            totalBillPrice = (fuelQuantityInLiters * dieselFuelPrice) + 100
            totalBillLabel.text = String(totalBillPrice)
            
        }
    }
}
//MARK: ~ firebase data saving
extension FuelDetailsVC {
    
    func convertRegionToDictionary(region: MKCoordinateRegion) -> [String: Any] {
        return [
            "centerLatitude": region.center.latitude,
            "centerLongitude": region.center.longitude,
            "latitudeDelta": region.span.latitudeDelta,
            "longitudeDelta": region.span.longitudeDelta
        ]
    }
    
    func savingDeliveryHistory() {
        fuelSelection()
        let deleiveryDocumentID = "deleivery"
        let userDeliveryLocation = convertRegionToDictionary(region: userLocation!)
        
        db.collection(sender!)
            .document(documentID)
            .collection(deliveryHistoryID)
            .document(deleiveryDocumentID)
            .setData(["Bill": totalBillPrice,
                      "Address": deliveryAddress,
                      "fuelQuantity": fuelQuantityInLiters,
                      "fuelType": fuelType,
                      "FuelCompany": fuelCompany,
                      "UserLocation": userDeliveryLocation,
                      "createdAt": Timestamp(date: Date())
                     ])
        { (error) in
            if let e = error {
                let alert = UIAlertController(title: "Woops", message: e.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            } else {
                print("Success")
            }
        }
    }
    
    func savingData() {
        let totalFuel = fuelQuantityInLiters + prevFuelQuantity
        let a = db.collection(sender!).document(documentID)
        a.updateData(["fuelQty": fuelQuantityInLiters,
                      "totalRefills": FieldValue.increment(Int64(1)),
                      "totalFuelQty": totalFuel
                     ])
    }
    
    func updatingFuelQty() {
        db.collection(sender!).getDocuments { querySnapshot, error in
            if let e = error {
                print("Profile\(e.localizedDescription)")
            } else {
                if let snapshotDocument = querySnapshot?.documents {
                    for doc in snapshotDocument {
                        let dataa = doc.data()
                        if let fuelQty = dataa["totalFuelQty"] as? Int
                        {
                            self.prevFuelQuantity = Double(fuelQty)
                        }
                    }
                }
            }
        }
    }
}
