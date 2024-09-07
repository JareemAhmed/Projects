//
//  CarModelYearTBVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/18/24.
//

import UIKit

class CarModelYearTBVC: UITableViewController {
    
    var modelYear = ModelYear()
    var filteredYears: [String] = []
    var carCompany1 = ""
    var carModel1 = ""
    var roadSideServiceSelected3 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(named: "mechanics-logo-black 2"))
        imageView.contentMode = .scaleAspectFit
           imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        self.navigationItem.titleView = imageView
        
        filteredYears = modelYear.year
        tableView.register(UINib(nibName: "YearSearchFieldCell", bundle: nil), forCellReuseIdentifier: "Cell2")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return filteredYears.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)  as? YearSearchFieldCell else {
                return UITableViewCell()
            }
            tableView.rowHeight = 110
            cell.searchBar.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "yearCell", for: indexPath)
            cell.textLabel?.text = filteredYears[indexPath.row]
            tableView.rowHeight = 60.0
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if roadSideServiceSelected3 == "true" {
            performSegue(withIdentifier: "roadSideServiceSelected", sender: self)
        } else {
            performSegue(withIdentifier: "yearSelected", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "yearSelected" {
            let controller = segue.destination as? CarPartsDetailsTBVC
            controller?.carModel = carModel1
            controller?.carCompany = carCompany1
        }
        if segue.identifier == "roadSideServiceSelected" {
            let controller = segue.destination as? AddressVC
            controller?.roadSideAssistanceSelected = "true"
        }
    }
}

extension CarModelYearTBVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text!.isEmpty {
            filteredYears = modelYear.year
            tableView.reloadData()
            return
        }
        filteredYears = modelYear.year.filter { return $0.contains(searchBar.text!) }
        tableView.reloadData()
    }
}

