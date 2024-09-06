//
//  SignUpVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/9/24.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage


class SignUpVC: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
        userImageView.addGestureRecognizer(gesture)
        UI()
    }
    
    @objc private func didTapChangeProfilePic() {
        presentPhotoActionScheet()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "backPressed", sender: self)
    }
    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        
        let documentID = "UserData"
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alert = UIAlertController(title: "Woops", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                } else {
                    self.performSegue(withIdentifier: "signupSuccess", sender: self)
                    //MARK: ~ imageuploading
                    let storageRef = Storage.storage().reference()
                    let selectedImage: UIImage? = self.userImageView.image
                    guard selectedImage != nil else {
                        return
                    }
                    let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
                    guard imageData != nil else {
                        return
                    }
                    let path = "images/\(UUID().uuidString).jpg"
                    let fileRef = storageRef.child(path)
                    let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
                        if error == nil && metadata != nil {
                            let sender = Auth.auth().currentUser?.email
                            self.db.collection(sender!).document(documentID).updateData(["URL": path])
                        }
                    }
                    //MARK: END
                if let name = self.nameTextField.text, let phomeNumber = self.phoneNoTextField.text,
                       let email = self.emailTextField.text,
                       let sender = Auth.auth().currentUser?.email {
                    self.db.collection(sender).document(documentID).setData(["name": name,
                                                                      "phoneNumber": phomeNumber,
                                                                      "email": email
                                                                     ], merge: true
                        ) { (error) in
                            if let e = error {
                                let alert = UIAlertController(title: "Woops", message: e.localizedDescription, preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                                self.present(alert, animated: true)
                            } else {
                                
                                print("Success")
                            }
                        }
                    }
                }
            }
        }
    }
    
    func UI() {
        
        userImageView.layer.cornerRadius = userImageView.frame.size.width/2.0
        
        signUpButton.layer.borderColor = UIColor.black.cgColor
        signUpButton.layer.borderWidth = 2.0
        signUpButton.layer.cornerRadius = 10.0
        signUpButton.layer.shadowColor = UIColor.black.cgColor
        signUpButton.layer.shadowOpacity = 0.5
        signUpButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        signUpButton.layer.shadowRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionScheet() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "How would you like to select a picture", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take photo",
                                            style: .default,
                                            handler: { [weak self]_ in
            self?.presenCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose photo",
                                            style: .default,
                                            handler: { [weak self]_ in
            self?.presentPhotoPicker()
        }))
        present(actionSheet, animated: true)
    }
    
    func presenCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        self.userImageView.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
