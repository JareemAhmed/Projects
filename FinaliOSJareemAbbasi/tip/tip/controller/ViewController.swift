//
//  ViewController.swift
//  tip
//
//  Created by Apple on 4/20/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    @IBOutlet weak var tipPicker: UIPickerView!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitPicker: UIPickerView!
    
    var picker = pickerManager()
    var billTotal = 0.0
    var numberOfPeople = 2
    var tip = 0.10
    var finalResult = ""
    var selectedTip = "0.0"
    var selectedPeople = "2.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitPicker.delegate = self
        splitPicker.dataSource = self
    }
  
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return picker.tip.count
        } else {
            return picker.splitPeople.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return picker.tip[row]
        } else {
            return picker.splitPeople[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        if pickerView.tag == 1 {
            selectedTip = picker.tip[row]

        } else {
            selectedPeople = picker.splitPeople[row]

        }
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let buttonTitleMinusPercentSign =  String(selectedTip.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
        let selectedPeopleAsString = String(selectedPeople)
        let selectedPeopleAsDouble = Int(selectedPeopleAsString)
        
        let bill = billTextField.text!
        billTotal = Double(bill) ?? 0.0
        let result = billTotal * (1 + tip) / Double(selectedPeopleAsDouble ?? 0)
        finalResult = String(format: "%.2f", result)

        
        self.performSegue(withIdentifier: "gotTheResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedPeopleAsString = String(selectedPeople)
        let selectedPeopleAsDouble = Int(selectedPeopleAsString)


        if segue.identifier == "gotTheResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip1 = Int(tip * 100)
            destinationVC.split = selectedPeopleAsDouble ?? 0
            destinationVC.complition = { val in
                self.billTextField.text = val
            }
        }
    }
}
    

