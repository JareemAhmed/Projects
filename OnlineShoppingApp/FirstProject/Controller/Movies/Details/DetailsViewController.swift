//
//  DetailsMovieViewController.swift
//  FirstProject
//
//  Created by Apple on 6/7/24.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var stockLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    var data: Product? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        configureInitialData()
        setData()
       // self.view.changeTextColorOfAllLabels(to: .white)
    }
    @IBAction func seeReview(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "ReviewsViewController") as? ReviewsViewController {
            vc.data = data?.reviews
            self.navigationController?.present(vc, animated: true)
        }
    }
    func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        HelperComponent.getInstance.setNavigationBar(leftBarItem: backBarButton(),title: "Product Detail", isTransparent: true, itemsColor: UIColor.white, vc: self)
    
    }
    func configureInitialData() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: Images.viewBg.rawValue)!)
    }
    
    @IBOutlet weak var lblStack: UIStackView!
    func setData(){
        lblStack.setRatingBar(for: Int(data?.rating ?? 0))
//        ratingLbl.text = String("\(data?.rating ?? 0)⭐ Ratings")
        stockLbl.text = "\(data?.stock ?? 0) (\(data?.availabilityStatus ?? ""))"
        nameLbl.text = "\(data?.title ?? "")"
        descriptionLbl.text = data?.description ?? ""
        print(data?.images?.first ?? "")
        imageView?.sd_setImage(with: URL(string: data?.images?.first ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        priceLbl.text = String("\(data?.price ?? 0)$")
      // statusLbl.text = "(\(data?.availabilityStatus ?? ""))"
    }
    
    
}
//extension UIView {
//    func changeTextColorOfAllLabels(to color: UIColor) {
//        for subview in self.subviews {
//            if let label = subview as? UILabel {
//                label.textColor = color
//            } else {
//                subview.changeTextColorOfAllLabels(to: color)
//            }
//        }
//    }
//}
extension UIStackView {
    
    func setRatingBar(for rateValue: Int) {
        let maxRating = 5 // The maximum rating value (e.g., 5 stars)
        for index in 0..<maxRating {
            if let button = self.subviews[index] as? UIButton {
                if index < rateValue {
                    button.setImage(UIImage(named: Images.icStarFilled.rawValue), for: .normal)
                } else {
                    button.setImage(UIImage(named: Images.icStarEmpty.rawValue), for: .normal)
                }
                
//                button.imageView?.contentMode = .scaleAspectFit
                
            }
        }
    }
    
    func resetRatingBar(for rateValue: Int) {
        let _ = (rateValue..<5).enumerated().map { index, _ in
            (self.subviews[index] as? UIButton)?.setImage(Images.icStarEmpty.image, for: .normal)
       }
    }
}
