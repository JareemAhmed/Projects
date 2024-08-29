//
//  LoginViewController.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/8/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var passwordImageView: UIImageView!
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var GoogleButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       UI()

    }
    
    @IBAction func twitterButtonPressed(_ sender: UIButton) {
    }
    @IBAction func facebookButtonPressed(_ sender: UIButton) {
    }
    @IBAction func googleButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    
    func UI() {
        
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.borderWidth = 2.0
        loginButton.layer.cornerRadius = 10.0
        
        signUpButton.layer.borderColor = UIColor.black.cgColor
        signUpButton.layer.borderWidth = 2.0
        signUpButton.layer.cornerRadius = 10.0
    }
}
