//
//  CarPartsDetailsTBVC.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/19/24.
//

import UIKit
import Alamofire

class CarPartsDetailsTBVC: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let image = UIImage(named: "bmw")
    var carCompany = ""
    var carModel = ""
    var userSearchText = ""
    var itemss: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        searchBar.delegate = self
        tableView.register(UINib(nibName: "CarPartsDetailsCell", bundle: nil), forCellReuseIdentifier: "Cell3")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemss.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath)  as? CarPartsDetailsCell else {
            return UITableViewCell()
        }
        tableView.rowHeight = 110
        let item = itemss[indexPath.row]
        let title = item.title?.first ?? "No Title"
        let imageURL = item.galleryURL?.first ?? ""
        cell.titleLabel.text = title
        if let url = URL(string: imageURL) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        cell.carPartImage?.image = UIImage(data: data)
                    }
                }
            }
        } else {
            cell.carPartImage?.image = UIImage(named: "placeholder") // Fallback image
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "PartSelected", sender: self)
    }
    
    func fetchCarParts() {
        let URL = "https://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=JareemAb-fuelDeli-PRD-16ec0daf0-18f6971f&RESPONSE-DATA-FORMAT=JSON&keywords="
        let fullURL = "\(URL)\(carCompany)%20\(carModel)%20\(userSearchText)&paginationInput.entriesPerPage=10&sortOrder=BestMatch"
        print(fullURL)
        AF.request(fullURL).responseDecodable(of: Welcome.self) { response in
            switch response.result {
            case .success(let welcome):
                if let items = welcome.findItemsByKeywordsResponse?.first?.searchResult?.first?.item {
                    for item in items {
                        let price = item.sellingStatus?.first?.currentPrice?.first?.value ?? "No price"
                        print(price)
                        let currency = item.sellingStatus?.first?.currentPrice?.first?.currencyID ?? ""
                        print(currency)
                        guard let response = welcome.findItemsByKeywordsResponse?.first,
                              let searchResults = response.searchResult?.first,
                              let fetchedItems = searchResults.item else {
                            return
                        }
                        self.itemss = fetchedItems
                        self.tableView.reloadData()
                    }
                } else {
                    let alert = UIAlertController(title: "Woops", message: "No items found", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    
                }
            case .failure(let error):
                let alert = UIAlertController(title: "Woops", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
}

extension CarPartsDetailsTBVC {
    
    func updateUI() {
        let imageView = UIImageView(image: UIImage(named: "mechanics-logo-black 2"))
        imageView.contentMode = .scaleAspectFit
           imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        self.navigationItem.titleView = imageView
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        userSearchText = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchCarParts()
    }
}
