//
//  LoginViewModel.swift
//  FirstProject
//
//  Created by TeamX Tec on 14/04/2024.
//

import Foundation
protocol LoginViewModelDelegate: AnyObject {
    func variableDidChange(newValue: Bool)
}
class LoginViewModel: NSObject{
    var emailTextField : AppCustomTextField!
    var passwordTextField: AppCustomTextField!
    private let helper = ValidationHelper.shared
    var isVariableTrue: Bool = false {
           didSet {
               // Notify the delegate when the variable changes
               delegate?.variableDidChange(newValue: isVariableTrue)
           }
       }
       
       // Weak reference to the delegate to prevent retain cycles
       weak var delegate: LoginViewModelDelegate?
   
    func performApi() {
        delegate?.variableDidChange(newValue: true)
            // Check if email field is empty
//            guard let email = emailTextField.text, !email.isEmpty else {
//                emailTextField.showError(message: "Email field can't be empty")
//                return
//            }
//            emailTextField.hideError()
//            
//            // Check if password field is empty
//            guard let password = passwordTextField.text, !password.isEmpty else {
//                passwordTextField.showError(message: "Password field can't be empty")
//                return
//            }
//            passwordTextField.hideError()
//            
//            // Validate email
//        if !helper.validate(email,fieldValidation: .email) {
//            emailTextField.showError(message: helper.errorMsgText)
//                return
//            }
//            emailTextField.hideError()
//            
//            // Validate password
//            if !helper.validate(password,fieldValidation: .password) {
//                passwordTextField.showError(message: helper.errorMsgText)
//                return
//            }
//            passwordTextField.hideError()
//            
//           apiPerform()
        }
    func apiPerform(){
        if emailTextField.text == "z@gmail.com" && passwordTextField.text == "Test@123"{
            delegate?.variableDidChange(newValue: true)
        }else{
            DispatchQueue.main.async {
                HelperComponent.getInstance.showAlert(title: "Error", message: "Invalid Credentials!")
            }
        }
    }
}
