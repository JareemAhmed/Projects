//
//  ReviewsView.swift
//  FirstProject
//
//  Created by TeamX Tec on 28/06/2024.
//

import Foundation
import UIKit

class ReviewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var lblTableview: UITableView!
    var data : [Review]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data as Any)
        configureInitialData()
        reloadTableData()
        registerCell()
    }
    func reloadTableData() {
        DispatchQueue.main.async {
            self.lblTableview.reloadData()
        }
    }
    func configureInitialData() {
        self.lblTableview.delegate = self
        self.lblTableview.dataSource = self
        if let bgImage = UIImage(named: Images.viewBg.rawValue) {
                   self.view.backgroundColor = UIColor(patternImage: bgImage)
               } else {
                   print("Background image not found")
               }
 }
    func registerCell(){
        TableViewUtils.registerCell(for: lblTableview, withNibName: CellIdentifires.reviewCell.rawValue, reuseIdentifier: CellIdentifires.reviewCell.rawValue)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifires.reviewCell.rawValue, for: indexPath) as! ReviewsViewCell
        if let data = self.data?[indexPath.row]{
            cell.configureData(reviewerName: data.reviewerName ?? "", date: data.date ?? "", rating: data.rating ?? 0, comment: data.comment ?? "")
        }
        return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150.0;//Choose your custom row height
        }
        
        
    }

