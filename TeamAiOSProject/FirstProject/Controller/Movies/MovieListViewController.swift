//
//  MovieListViewController.swift
//  FirstProject
//
//  Created by TeamX Tec on 04/06/2024.
//

import UIKit


class MovieListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   @IBOutlet weak var tableView: UITableView!
    
    var data : GetAllProducts? = nil
    var leftBarButton : UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: "icAdd")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(onClickLeftBtn))
    }
    @objc func onClickLeftBtn(_ sender: UIButton) {
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        networkCall()
        setNavigationBar()
        configureInitialData()
        registerCell()
        
    }
    
    func networkCall(){
        NetworkService.getProducts { result in
          switch result {
          case let .success(data):
            print(data)
              self.data = data
              HelperComponent.getInstance.showAlert(title: "Alert", message: "Data Fetch SuccessFully")
              self.reloadTableData()
          case let .failure(error):
              HelperComponent.getInstance.showAlert(title: "Alert", message: error.localizedDescription)
          }
        }
    }
    func setNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        HelperComponent.getInstance.setNavigationBar(rightBarItem: leftBarButton, title: "Product List", isTransparent: true, itemsColor: UIColor.white, vc: self)
        
      
    }
    func reloadTableData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func configureInitialData() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: Images.viewBg.rawValue)!)

    
        
    }
    func registerCell(){
        TableViewUtils.registerCell(for: tableView, withNibName: CellIdentifires.movieCell.rawValue, reuseIdentifier: CellIdentifires.movieCell.rawValue)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.products?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0;//Choose your custom row height
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifires.movieCell.rawValue, for: indexPath) as! MovieCellTableViewCell
        if let data = self.data?.products?[indexPath.row]{
            cell.configureData(text:  data.title ?? "",date: data.meta?.createdAt ?? "", rating: String(data.rating ?? 0),image: data.images?.first ?? "")
        }
       
//        cell.backgroundColor = UIColor.red
        return cell
           }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController {
            vc.data = data?.products?[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
           
//            vc.reviews = data?products?[indexPath.row].reviews?.first?.comment
//            vc.image = UIImage(named: (data?.products?[indexPath.row].images?.first!)!)
        }
    }
}
