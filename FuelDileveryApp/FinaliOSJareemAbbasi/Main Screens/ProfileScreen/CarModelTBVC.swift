//
//  CarModelTBV.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/17/24.
//

import UIKit

class CarModelTBVC: UITableViewController {
    
    var carModels = CarModels()
    var carCompany = ""
    var carModel2 = ""
    var filteredHondaCarModels: [String] = []
    var filteredIsuzuCarModels: [String] = []
    var filteredKiaCarModels: [String] = []
    var filteredMgCarModels: [String] = []
    var filteredSuzukiCarModels: [String] = []
    var filteredNissanCarModels: [String] = []
    var filteredHyundaiCarModels: [String] = []
    var filteredMitsubishiCarModels: [String] = []
    var filteredTeslaCarModels: [String] = []
    var filteredToyotaCarModels: [String] = []
    var filteredBmwCarModels: [String] = []
    var filteredAudiCarModels: [String] = []
    var filteredFordCarModels: [String] = []
    var filteredLAndRoverCarModels: [String] = []
    
    var roadSideServiceSelected2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "carBrandSelected")
        tableView.register(UINib(nibName: "CarModelSearchFieldCell", bundle: nil), forCellReuseIdentifier: "Cell1")
        filteredHondaCarModels = carModels.Honda
        filteredIsuzuCarModels = carModels.Isuzu
        filteredKiaCarModels = carModels.Kia
        filteredMgCarModels = carModels.Mg
        filteredSuzukiCarModels = carModels.Suzuki
        filteredNissanCarModels = carModels.Nissan
        filteredHyundaiCarModels = carModels.Hyunadai
        filteredMitsubishiCarModels = carModels.Mitsubishi
        filteredTeslaCarModels = carModels.Tesla
        filteredToyotaCarModels = carModels.Toyota
        filteredBmwCarModels = carModels.Bmw
        filteredAudiCarModels = carModels.Audi
        filteredFordCarModels = carModels.ford
        filteredLAndRoverCarModels = carModels.landRover
        
        let imageView = UIImageView(image: UIImage(named: "mechanics-logo-black 2"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        self.navigationItem.titleView = imageView
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if section == 0 {
            return 1
        } else {
            switch carCompany {
            case "Honda":
                return filteredHondaCarModels.count
            case "Isuzu":
                return filteredIsuzuCarModels.count
            case "Kia":
                return filteredKiaCarModels.count
            case "Mg":
                return filteredMgCarModels.count
            case "Suzuki":
                return filteredSuzukiCarModels.count
            case "Nissan":
                return filteredNissanCarModels.count
            case "Hyundai":
                return filteredHyundaiCarModels.count
            case "Mitsubishi":
                return filteredMitsubishiCarModels.count
            case "Tesla":
                return filteredTeslaCarModels.count
            case "Toyota":
                return filteredToyotaCarModels.count
            case "Bmw":
                return filteredBmwCarModels.count
            case "Audi":
                return filteredAudiCarModels.count
            case "Ford":
                return filteredFordCarModels.count
            case "LandRover":
                return filteredLAndRoverCarModels.count
            default:
                return filteredIsuzuCarModels.count
                
            }
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)  as? CarModelSearchFieldCell else {
                return UITableViewCell()
            }
            tableView.rowHeight = 110.0
            cell.searchBar.delegate = self
            return cell
        } else if carCompany == "Honda" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let hondamodels = filteredHondaCarModels[indexPath.row]
            cell.textLabel?.text = hondamodels
            carModel2 = hondamodels
            return cell
        } else if carCompany == "Isuzu" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let isuzumodels = filteredIsuzuCarModels[indexPath.row]
            cell.textLabel?.text = isuzumodels
            carModel2 = isuzumodels
            return cell
        } else if carCompany == "Kia" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let models = filteredKiaCarModels[indexPath.row]
            cell.textLabel?.text = models
            carModel2 = models
            return cell
        } else if carCompany == "Mg" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let models = filteredMgCarModels[indexPath.row]
            cell.textLabel?.text = models
            carModel2 = models
            return cell
        } else if carCompany == "Suzuki" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let models = filteredSuzukiCarModels[indexPath.row]
            cell.textLabel?.text = models
            carModel2 = models
            return cell
        } else if carCompany == "Nissan" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let models = filteredNissanCarModels[indexPath.row]
            cell.textLabel?.text = models
            carModel2 = models
            return cell
        } else if carCompany == "Hyundai" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let models = filteredHyundaiCarModels[indexPath.row]
            cell.textLabel?.text = models
            carModel2 = models
            return cell
        } else if carCompany == "Mitsubishi" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let models = filteredMitsubishiCarModels[indexPath.row]
            cell.textLabel?.text = models
            carModel2 = models
            return cell
        } else if carCompany == "Tesla" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let models = filteredTeslaCarModels[indexPath.row]
            cell.textLabel?.text = models
            carModel2 = models
            return cell
        } else if carCompany == "Toyota" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let models = filteredToyotaCarModels[indexPath.row]
            cell.textLabel?.text = models
            carModel2 = models
            return cell
        } else if carCompany == "Bmw" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let models = filteredBmwCarModels[indexPath.row]
            cell.textLabel?.text = models
            carModel2 = models
            return cell
        } else if carCompany == "Audi" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let models = filteredAudiCarModels[indexPath.row]
            cell.textLabel?.text = models
            carModel2 = models
            return cell
        } else if carCompany == "Ford" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let models = filteredFordCarModels[indexPath.row]
            cell.textLabel?.text = models
            carModel2 = models
            return cell
        } else if carCompany == "LandRover" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            tableView.rowHeight = 60.0
            let models = filteredLAndRoverCarModels[indexPath.row]
            cell.textLabel?.text = models
            carModel2 = models
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carBrandSelected", for: indexPath)
            cell.textLabel?.text = "No data"
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "carModelSelected", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if roadSideServiceSelected2 == "true" {
            if segue.identifier == "carModelSelected" {
                let controller = segue.destination as? CarModelYearTBVC
                controller?.carModel1 = carModel2
                controller?.carCompany1 = carCompany
                controller?.roadSideServiceSelected3 = "true"
            } else {
                if segue.identifier == "carModelSelected" {
                    let controller = segue.destination as? CarModelYearTBVC
                    controller?.carModel1 = carModel2
                    controller?.carCompany1 = carCompany
                }
            }
        }
    }
}

extension CarModelTBVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text!.isEmpty {
            filteredHondaCarModels = carModels.Honda
            filteredIsuzuCarModels = carModels.Isuzu
            filteredKiaCarModels = carModels.Kia
            filteredMgCarModels = carModels.Mg
            filteredSuzukiCarModels = carModels.Suzuki
            filteredNissanCarModels = carModels.Nissan
            filteredHyundaiCarModels = carModels.Hyunadai
            filteredMitsubishiCarModels = carModels.Mitsubishi
            filteredTeslaCarModels = carModels.Tesla
            filteredToyotaCarModels = carModels.Toyota
            filteredBmwCarModels = carModels.Bmw
            filteredAudiCarModels = carModels.Audi
            filteredFordCarModels = carModels.ford
            filteredLAndRoverCarModels = carModels.landRover
            tableView.reloadData()
            return
        }
        
        switch carCompany {
        case "Honda":
            filteredHondaCarModels = carModels.Honda.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "Isuzu":
            filteredIsuzuCarModels = carModels.Isuzu.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "Kia":
            filteredKiaCarModels = carModels.Kia.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "Mg":
            filteredMgCarModels = carModels.Mg.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "Suzuki":
            filteredSuzukiCarModels = carModels.Suzuki.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "Nissan":
            filteredNissanCarModels = carModels.Nissan.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "Hyundai":
            filteredHyundaiCarModels = carModels.Hyunadai.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "Mitsubishi":
            filteredMitsubishiCarModels = carModels.Mitsubishi.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "Tesla":
            filteredTeslaCarModels = carModels.Tesla.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "Toyota":
            filteredToyotaCarModels = carModels.Toyota.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "Bmw":
            filteredBmwCarModels = carModels.Bmw.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "Audi":
            filteredAudiCarModels = carModels.Audi.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "Ford":
            filteredFordCarModels = carModels.ford.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        case "LandRover":
            filteredLAndRoverCarModels = carModels.landRover.filter { return $0.contains(searchBar.text!) }
            tableView.reloadData()
        default:
            return
        }
    }
}
