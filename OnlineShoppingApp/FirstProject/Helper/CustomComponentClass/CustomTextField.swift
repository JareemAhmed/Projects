//
//  CustomTextField.swift
//  FirstProject
//
//  Created by TeamX Tec on 13/04/2024.
//

import Foundation
import UIKit
class CustomTextField: UITextField {

    convenience init() {
        self.init(frame: .zero)
        let border = CALayer()
        let width = CGFloat(77.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.width, height: frame.size.height)

        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
    }

}
class AppTextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setupFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupFont()
    }
    
    func setupFont(){
        if self.font!.isBold{
            self.font = Theme.getAppBoldFont(withSize: self.font!.pointSize)
        }else if self.font!.isMedium{
            self.font = Theme.getAppMediumFont(withSize: self.font!.pointSize)
        }else if self.font!.isSemiBold{
            self.font = Theme.getAppSemiBoldFont(withSize: self.font!.pointSize)
        }else{
            self.font = Theme.getAppFont(withSize: self.font!.pointSize)
        }
    }
    
    func setPadding(left: CGFloat? = nil, right: CGFloat? = nil){
        if let left = left {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
        
        if let right = right {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}


import UIKit

class AppCustomTextField: UITextField {
    
    // MARK: - Properties
    
    private let errorLabel = UILabel()
    private let focusedBorderColor = UIColor.orange.cgColor
    private let defaultBorderColor = UIColor(named: "primaryBlue")?.cgColor
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextField()
    }
    
    // MARK: - Setup
    
    private func setupTextField() {
        // Apply the specified modifiers
        
        // Add padding
        setPadding()
        
        // Add background color
        backgroundColor = UIColor.clear
        
        // Add corner radius
        layer.cornerRadius = 12
        
        // Add border
        layer.borderWidth = 1
        layer.borderColor = defaultBorderColor
        
        // Configure error label
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.font = Theme.getAppFont(withSize: 12)
        addSubview(errorLabel)
        
        // Set up constraints for error label
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            errorLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 2),
            errorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 2 + errorLabel.font.lineHeight) // Adjust the constant as needed for additional padding
        ])
        errorLabel.textColor = .red
        errorLabel.isHidden = true
        
        // Add observer for UITextField textDidBeginEditing notification
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidBeginEditing(_:)), name: UITextField.textDidBeginEditingNotification, object: nil)
        
        // Add observer for UITextField textDidEndEditing notification
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidEndEditing(_:)), name: UITextField.textDidEndEditingNotification, object: nil)
    }
//    override func resignFirstResponder() -> Bool {
//           // Reset border color when resigning focus
//           layer.borderColor = focusedBorderColor
//           return super.resignFirstResponder()
//       }
       
    // MARK: - Focus Handling
    
    @objc private func textFieldDidBeginEditing(_ textField: UITextField) {
        // Perform any actions when the text field becomes focused
        // For example, change the border color
       // layer.borderColor = focusedBorderColor
    }
    
    @objc private func textFieldDidEndEditing(_ textField: UITextField) {
        // Perform any actions when the text field loses focus
        // For example, change the border color back to the original color
       //layer.borderColor = defaultBorderColor
    }
    
    // MARK: - Deinitialization
    
    deinit {
        // Remove observers to avoid memory leaks
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Additional Modifiers
    
    func setPadding(_ amount: CGFloat = 8.0) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
    // MARK: - Error Handling
    
    func showError(message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    func hideError() {
        errorLabel.isHidden = true
    }
    
}

