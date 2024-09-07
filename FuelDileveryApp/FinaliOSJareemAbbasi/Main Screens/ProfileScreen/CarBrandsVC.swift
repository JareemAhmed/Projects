//
//  CarBrandsVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/17/24.
//

import UIKit

class CarBrandsVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var landRoverButton: UIButton!
    @IBOutlet weak var fordButton: UIButton!
    @IBOutlet weak var bmwButton: UIButton!
    @IBOutlet weak var audiButton: UIButton!
    @IBOutlet weak var toyotaButton: UIButton!
    @IBOutlet weak var teslaButton: UIButton!
    @IBOutlet weak var mitsubishiButton: UIButton!
    @IBOutlet weak var hyundaiButton: UIButton!
    @IBOutlet weak var nissanButton: UIButton!
    @IBOutlet weak var suzukiButton: UIButton!
    @IBOutlet weak var mgButton: UIButton!
    @IBOutlet weak var kiaButton: UIButton!
    @IBOutlet weak var isuzuButton: UIButton!
    @IBOutlet weak var hondaButton: UIButton!
    
    var roadSideServiceSelected1 = ""
    var buttonImageMap: [UIButton: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        UpdateUI()
        
        buttonImageMap = [
                hondaButton: "honda",
                isuzuButton: "isuzu",
                kiaButton: "kia",
                mgButton: "mg 1",
                suzukiButton: "suzuki",
                nissanButton: "nissan",
                hyundaiButton: "hyundai",
                mitsubishiButton: "mitsubishi",
                teslaButton: "tesla",
                toyotaButton: "toyota",
                bmwButton: "bmw",
                audiButton: "audi",
                fordButton: "ford",
                landRoverButton: "land-rover"
            ]
    }
    
    @IBAction func hondaButtonClicked(_ sender: UIButton) {
    }
    @IBAction func isuzuButtonClicked(_ sender: UIButton) {
    }
    @IBAction func kiaButtonClicked(_ sender: UIButton) {
    }
    @IBAction func mgButtonClicked(_ sender: UIButton) {
    }
    @IBAction func suzukiButtonClicked(_ sender: UIButton) {
    }
    @IBAction func fawButtonClicked(_ sender: UIButton) {
    }
    @IBAction func hyundaiButtonClicked(_ sender: UIButton) {
    }
    @IBAction func mitsubishiButtonClicked(_ sender: UIButton) {
    }
    @IBAction func teslaButtonClicked(_ sender: UIButton) {
    }
    @IBAction func totyotaButtonClicked(_ sender: UIButton) {
    }
    @IBAction func audiButtonClicked(_ sender: UIButton) {
    }
    @IBAction func bmwButtonClicked(_ sender: UIButton) {
    }
    @IBAction func fordButtonClicked(_ sender: UIButton) {
    }
    @IBAction func landRoverButtonClicked(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if roadSideServiceSelected1 == "true" {
            let controller = segue.destination as! CarModelTBVC
            controller.roadSideServiceSelected2 = "true"
        }
        
        switch segue.identifier {
        case "HondaSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Honda"
        case "IsuzuSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Isuzu"
        case "KiaSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Kia"
        case "MgSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Mg"
        case "SuzukiSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Suzuki"
        case "NissanSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Nissan"
        case "HyundaiSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Hyundai"
        case "MitsubishiSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Mitsubishi"
        case "TeslaSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Tesla"
        case "ToyotaSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Toyota"
        case "BmwSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Bmw"
        case "AudiSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Audi"
        case "FordSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "Ford"
        case "LandRoverSelected":
            let controller = segue.destination as! CarModelTBVC
            controller.carCompany = "LandRover"
        default:
            return
        }
    }
}
extension CarBrandsVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterButtons(for: searchText)
    }
    func filterButtons(for searchText: String) {
        if searchText.isEmpty {
            // Show all buttons if search text is empty
            buttonImageMap.keys.forEach { $0.isHidden = false }
        } else {
            // Loop through all buttons and hide those that don't match the search text
            buttonImageMap.forEach { button, imageName in
                button.isHidden = !imageName.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
extension CarBrandsVC {
    func UpdateUI() {
        
        let imageView = UIImageView(image: UIImage(named: "mechanics-logo-black 2"))
        imageView.contentMode = .scaleAspectFit
           imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        self.navigationItem.titleView = imageView
        
        landRoverButton.layer.cornerRadius = 10.0
        landRoverButton.layer.shadowColor = UIColor.black.cgColor
        landRoverButton.layer.shadowOpacity = 0.5
        landRoverButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        landRoverButton.layer.shadowRadius = 10
        
        fordButton.layer.cornerRadius = 10.0
        fordButton.layer.shadowColor = UIColor.black.cgColor
        fordButton.layer.shadowOpacity = 0.5
        fordButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        fordButton.layer.shadowRadius = 10
        
        bmwButton.layer.cornerRadius = 10.0
        bmwButton.layer.shadowColor = UIColor.black.cgColor
        bmwButton.layer.shadowOpacity = 0.5
        bmwButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        bmwButton.layer.shadowRadius = 10
        
        audiButton.layer.cornerRadius = 10.0
        audiButton.layer.shadowColor = UIColor.black.cgColor
        audiButton.layer.shadowOpacity = 0.5
        audiButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        audiButton.layer.shadowRadius = 10
        
        toyotaButton.layer.cornerRadius = 10.0
        toyotaButton.layer.shadowColor = UIColor.black.cgColor
        toyotaButton.layer.shadowOpacity = 0.5
        toyotaButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        toyotaButton.layer.shadowRadius = 10
        
        teslaButton.layer.cornerRadius = 10.0
        teslaButton.layer.shadowColor = UIColor.black.cgColor
        teslaButton.layer.shadowOpacity = 0.5
        teslaButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        teslaButton.layer.shadowRadius = 10
        
        mitsubishiButton.layer.cornerRadius = 10.0
        mitsubishiButton.layer.shadowColor = UIColor.black.cgColor
        mitsubishiButton.layer.shadowOpacity = 0.5
        mitsubishiButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        mitsubishiButton.layer.shadowRadius = 10
        
        hyundaiButton.layer.cornerRadius = 10.0
        hyundaiButton.layer.shadowColor = UIColor.black.cgColor
        hyundaiButton.layer.shadowOpacity = 0.5
        hyundaiButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        hyundaiButton.layer.shadowRadius = 10
        
        nissanButton.layer.cornerRadius = 10.0
        nissanButton.layer.shadowColor = UIColor.black.cgColor
        nissanButton.layer.shadowOpacity = 0.5
        nissanButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        nissanButton.layer.shadowRadius = 10
        
        suzukiButton.layer.cornerRadius = 10.0
        suzukiButton.layer.shadowColor = UIColor.black.cgColor
        suzukiButton.layer.shadowOpacity = 0.5
        suzukiButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        suzukiButton.layer.shadowRadius = 10
        
        mgButton.layer.cornerRadius = 10.0
        mgButton.layer.shadowColor = UIColor.black.cgColor
        mgButton.layer.shadowOpacity = 0.5
        mgButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        mgButton.layer.shadowRadius = 10
        
        kiaButton.layer.cornerRadius = 10.0
        kiaButton.layer.shadowColor = UIColor.black.cgColor
        kiaButton.layer.shadowOpacity = 0.5
        kiaButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        kiaButton.layer.shadowRadius = 10
        
        isuzuButton.layer.cornerRadius = 10.0
        isuzuButton.layer.shadowColor = UIColor.black.cgColor
        isuzuButton.layer.shadowOpacity = 0.5
        isuzuButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        isuzuButton.layer.shadowRadius = 10
        
        hondaButton.layer.cornerRadius = 10.0
        hondaButton.layer.shadowColor = UIColor.black.cgColor
        hondaButton.layer.shadowOpacity = 0.5
        hondaButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        hondaButton.layer.shadowRadius = 10
        
      }
}
