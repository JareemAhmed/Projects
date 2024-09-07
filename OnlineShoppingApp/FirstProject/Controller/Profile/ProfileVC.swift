//
//  ViewController.swift
//  FirstProject
//
//  Created by TeamX Tec on 01/04/2024.
//

import UIKit

class ProfileVC: UIViewController{
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameTxtField: AppTextField!
    @IBOutlet weak var emailTxtField: AppTextField!
    @IBOutlet weak var passwordTxtField: AppTextField!
    @IBOutlet weak var jobTxtField: AppTextField!
    @IBOutlet weak var phoneNoTxtField: AppTextField!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var lblSlider: UISlider!
    @IBOutlet weak var lblSliderUpValue: CustomLabelBlack!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.makeRounded()
        tapGetsure()
        setNavigationBar()
        setTextFields()
        setData()
        
    }
    func setNavigationBar() {
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    func setTextFields(){
        self.passwordTxtField.isSecureTextEntry = true
        self.passwordTxtField.keyboardType = .alphabet
        phoneNoTxtField.keyboardType = .numbersAndPunctuation
    }
    func setData(){
        lblSlider.value = Float(UserDefaults.standard.userLucky)
        lblSliderUpValue.text = "The Selected Lucky Number is \(UserDefaults.standard.userLucky)"
        nameLbl.text = UserDefaults.standard.userName
        nameTxtField.text = UserDefaults.standard.userName
        emailTxtField.text = UserDefaults.standard.userEmail
        
        passwordTxtField.text = UserDefaults.standard.userPass
        
        phoneNoTxtField.text =  UserDefaults.standard.userPhone
        jobTxtField.text = UserDefaults.standard.userJob
        
    }
    @IBAction func saveProfileBtn(_ sender: Any) {
        UserDefaults.standard.userLucky =  Int(lblSlider.value)
        UserDefaults.standard.userName =  nameTxtField.text ?? ""
        UserDefaults.standard.userEmail =     emailTxtField.text ?? ""
        UserDefaults.standard.userPass =        passwordTxtField.text ?? ""
        UserDefaults.standard.userPhone =         phoneNoTxtField.text ?? ""
        UserDefaults.standard.userJob =    jobTxtField.text ?? ""
        
        HelperComponent.getInstance.showAlert(title: "Alert", message: "Data Saved Successfully!")
    }
    @IBAction func btnLogOutAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func actionSlider(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        lblSliderUpValue.text = "The Selected Lucky Number is \(currentValue)"
    }
}

// MARK: ImagePicker Delegate
extension ProfileVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        dismiss(animated: true,completion: nil)
        
    }
    
    func tapGetsure(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView?.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }
    @objc func imageTapped(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker,animated: true , completion: nil)
    }
}
extension UIImageView {
    
    func makeRounded() {
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
        
    }
}
