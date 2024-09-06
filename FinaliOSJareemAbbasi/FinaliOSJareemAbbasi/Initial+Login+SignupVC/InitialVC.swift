//
//  ViewController.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/3/24.
//

import UIKit

class InitialVC: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var buttonClicked = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = """
        Fuel at Your Doorstep.
        Never Run Out Again.
"""
    }

    @IBAction func nextButton(_ sender: UIButton) {
        
        if textLabel.text == """
        Fuel at Your Doorstep.
        Never Run Out Again.
"""
        {
          
            imageView.image = UIImage(named: "2")
            nextButton.setImage(UIImage(named: "4"), for: .normal)
            textLabel.text = """
            Quality Parts Delivered Fast.
            Get What Your Vehicle Needs.
"""
            
        } else if textLabel.text == """
            Quality Parts Delivered Fast.
            Get What Your Vehicle Needs.
"""
 {
            imageView.image = UIImage(named: "3")
            nextButton.setImage(UIImage(named: "6"), for: .normal)
            textLabel.text = """
            Help is On the Way.
            24/7 Roadside Assistance.
"""
            
        } else if textLabel.text == """
            Help is On the Way.
            24/7 Roadside Assistance.
""" 
        {
            performSegue(withIdentifier: "login", sender: self)
        }
    }
    
}

