//
//  Utilities.swift
//  FirstProject
//
//  Created by TeamX Tec on 04/06/2024.
//

import Foundation
import UIKit
class TableViewUtils{
    static func registerCell(for tableView: UITableView, withNibName nibName: String, reuseIdentifier: String) {
            tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        }
}
class ValidationHelper{
    static var shared = ValidationHelper()
    var errorMsgText = ""
    private enum PasswordCase: String {
        case uppercase = ".*[A-Z].*[A-Z].*"
        case lowercase = ".*[a-z].*[a-z].*"
        case number = ".*[0-9]+.*"
        case special = "^(?=(.*[-_!?/<>;:{}()*@.#$%^&+=]){2,})(?=\\S+$).{4,}$"
    }
//    }
    private func contains(case pCase:PasswordCase, in searchTerm: String) -> Bool {
        
        do {
            let regex = try NSRegularExpression(pattern: pCase.rawValue)
            if let _ = regex.firstMatch(in: searchTerm, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, searchTerm.count)) {
                return true
            } else {
                return false
            }
            
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
    }
    
    func validate(_ textFieldText : String = "",fieldValidation : Validation = .general) -> Bool{
    guard fieldValidation != .none else {
        return true
    }
    guard textFieldText != "" else {
//            errorMsgText = "Field is required"
        
        return false
    }
    
    switch fieldValidation {
    case .none:
        
        return true
    case .general:
        if textFieldText.isEmpty {
//                errorMsgText = "Field is required"
            return false
        }
        if (textFieldText.trimmingCharacters(in: .whitespaces).isEmpty) {
//                errorMsgText = "Field is required"
            return false
        }
        return true
        
    case .name:
        if (textFieldText.count < 3)  {
            errorMsgText = "Name must have 3 characters"
            return false
        }
        
    case .email:
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailTest.evaluate(with: textFieldText) {
            errorMsgText = "Enter correct email address"
            return false
        }
        
        
    case .password:
        if textFieldText.count < 8  {
            errorMsgText = "Must contain at least 8 characters, two uppercase, two lowercase, numeric, and two special character"
            return false
        }
//         else if !self.contains(case: .uppercase, in: textFieldText){
//            errorMsgText = "Must contain at least 8 characters, two uppercase, two lowercase , numeric, and two special character"
//            return false
//
//        } else if !self.contains(case: .lowercase, in: textFieldText){
//            errorMsgText = "Must contain at least 8 characters, two uppercase, two lowercase , numeric, and two special character"
//            return false
//
//        } else if !self.contains(case: .number, in: textFieldText){
//            errorMsgText = "Must contain at least 8 characters, two uppercase, two lowercase , numeric, and two special character"
//            return false
//
//        } else if !self.contains(case: .special, in: textFieldText){
//            errorMsgText = "Must contain at least 8 characters, two uppercase, two lowercase , numeric, and two special character"
//            return false
//        }
    case .normal_password:
        if textFieldText.count < 8  {
            errorMsgText = "Must contain at least 8 characters"
            return false
            
        }
        return true
    case .phone:
        if textFieldText.count < 10 ||
            textFieldText.count > 15{
            errorMsgText = "Number must be between 10-15 digits"
            return false
        }
        
        return true
        
    case .emailOrNumber:
        return true
    case .matchPass:
        if textFieldText == UserDefaults.standard.userPass {
            return true
        }else{
            errorMsgText = "Password is Wrong"
            return false
        }
    case .iban:
        if (textFieldText.count < 12)  {
            errorMsgText = "IBAN must have 15 characters"
            return false
        }
    }
    return true
}
    //Email Validation
    private func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

    //Password Validation
    private func isValidPassword(testStr:String) -> Bool {
        let passRegEx = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[-_!?/<>;:{}()*@#$%^&+=])(?=\\S+$).{4,}$"
        
        let passTest = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        return passTest.evaluate(with: testStr)
    }
}
