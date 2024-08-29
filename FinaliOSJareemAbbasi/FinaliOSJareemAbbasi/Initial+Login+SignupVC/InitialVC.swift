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
    }

    @IBAction func nextButton(_ sender: UIButton) {
        
        if textLabel.text == "In Swift, you can easily toggle the text of a label and the image in an image view using a single button."  {
          
            imageView.image = UIImage(named: "2")
            nextButton.setImage(UIImage(named: "4"), for: .normal)
            textLabel.text = "By leveraging the @IBAction function linked to the button's click event, you can alternate between two states."
            
        } else if textLabel.text == "By leveraging the @IBAction function linked to the button's click event, you can alternate between two states." {
            imageView.image = UIImage(named: "3")
            nextButton.setImage(UIImage(named: "6"), for: .normal)
            textLabel.text = "This simple setup allows for dynamic UI updates with minimal code."
            
        } else if textLabel.text == "This simple setup allows for dynamic UI updates with minimal code." {
            performSegue(withIdentifier: "login", sender: self)
        }
    }
    
}

