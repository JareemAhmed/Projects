//
//  ServicesOptionVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/16/24.
//

import UIKit

class ServicesOptionVC: UIViewController {

    @IBOutlet weak var roadSideAssistanceButton: UIButton!
    @IBOutlet weak var requestPartsButton: UIButton!
    @IBOutlet weak var requestServiceButton: UIButton!
    @IBOutlet weak var roadSideAssistanceImageView: UIImageView!
    @IBOutlet weak var requestPartsImageView: UIImageView!
    @IBOutlet weak var requestServiceImageView: UIImageView!
    
    var roadSideServicesSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UI()
    }
    
    @IBAction func requestServiceButtonPressend(_ sender: UIButton) {
        performSegue(withIdentifier: "servicesSelected", sender: self)
    }
    @IBAction func requestPartsButtonClicket(_ sender: UIButton) {
    }
    @IBAction func roadSideButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "roadSideServiceSelected", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "roadSideServiceSelected" {
            if let controller = segue.destination as? CarBrandsVC {
                controller.roadSideServiceSelected1 = "true"
            }
        }
            if segue.identifier == "servicesSelected" {
                if let controller = segue.destination as? AddressVC {
                    controller.serviceSelected = "true"
                }
            }
    }
}
extension ServicesOptionVC {
    
    func UI() {
        
        let imageView = UIImageView(image: UIImage(named: "mechanics-logo-black 2"))
        imageView.contentMode = .scaleAspectFit
           imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        self.navigationItem.titleView = imageView
        
        roadSideAssistanceImageView.layer.shadowColor = UIColor.black.cgColor
        roadSideAssistanceImageView.layer.shadowOpacity = 0.5
        roadSideAssistanceImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
        roadSideAssistanceImageView.layer.shadowRadius = 10
        
        requestPartsImageView.layer.shadowColor = UIColor.black.cgColor
        requestPartsImageView.layer.shadowOpacity = 0.5
        requestPartsImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
        requestPartsImageView.layer.shadowRadius = 10
        
        requestServiceImageView.layer.shadowColor = UIColor.black.cgColor
        requestServiceImageView.layer.shadowOpacity = 0.5
        requestServiceImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
        requestServiceImageView.layer.shadowRadius = 10
        
        requestServiceButton.layer.shadowColor = UIColor.black.cgColor
        requestServiceButton.layer.shadowOpacity = 0.5
        requestServiceButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        requestServiceButton.layer.shadowRadius = 10
        
        roadSideAssistanceButton.layer.borderColor = UIColor.black.cgColor
        roadSideAssistanceButton.layer.borderWidth = 2.0
        roadSideAssistanceButton.layer.cornerRadius = 10.0
        roadSideAssistanceButton.layer.shadowColor = UIColor.black.cgColor
        roadSideAssistanceButton.layer.shadowOpacity = 0.5
        roadSideAssistanceButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        roadSideAssistanceButton.layer.shadowRadius = 10
        
        requestPartsButton.layer.borderColor = UIColor.black.cgColor
        requestPartsButton.layer.borderWidth = 2.0
        requestPartsButton.layer.cornerRadius = 10.0
        requestPartsButton.layer.shadowColor = UIColor.black.cgColor
        requestPartsButton.layer.shadowOpacity = 0.5
        requestPartsButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        requestPartsButton.layer.shadowRadius = 10
        
        requestServiceButton.layer.borderColor = UIColor.black.cgColor
        requestServiceButton.layer.borderWidth = 2.0
        requestServiceButton.layer.cornerRadius = 10.0
        requestServiceButton.layer.shadowColor = UIColor.black.cgColor
        requestServiceButton.layer.shadowOpacity = 0.5
        requestServiceButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        requestServiceButton.layer.shadowRadius = 10
    }
}
