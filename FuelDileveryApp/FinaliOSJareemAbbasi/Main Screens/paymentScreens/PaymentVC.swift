//
//  PaymentVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/16/24.
//

import UIKit

class PaymentVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var payButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func trackOrderButtonClicked(_ sender: UIButton) {
    }
    
    func updateUI() {
        
        imageView.layer.cornerRadius = 10.0
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowOffset = CGSize(width: 5, height: 5)
        imageView.layer.shadowRadius = 10
        
        payButton.layer.borderColor = UIColor.black.cgColor
        payButton.layer.borderWidth = 2.0
        payButton.layer.cornerRadius = 10.0
        payButton.layer.shadowColor = UIColor.black.cgColor
        payButton.layer.shadowOpacity = 0.5
        payButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        payButton.layer.shadowRadius = 10
    }
}
