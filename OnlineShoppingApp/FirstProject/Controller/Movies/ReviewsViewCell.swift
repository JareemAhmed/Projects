//
//  ReviewsViewCell.swift
//  FirstProject
//
//  Created by TeamX Tec on 28/06/2024.
//

import UIKit

class ReviewsViewCell: UITableViewCell {

    @IBOutlet weak var lblRatings: AppLabel!
    @IBOutlet weak var lblRatingStack: UIStackView!
    @IBOutlet weak var lblCreatedAt: AppLabel!
    @IBOutlet weak var lblDescription: AppLabel!
    @IBOutlet weak var lblReviewerName: AppBoldLargeWhiteLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureData(reviewerName: String,date: String,rating:Int,comment:String){
        

        lblReviewerName.text = reviewerName
        if let date = date.convertToSimpleDateString(){
            lblCreatedAt.text = date
        }else{
            lblCreatedAt.text = "No date"
        }
        lblRatingStack.setRatingBar(for: rating)
        
        lblRatings.text = "\(rating)+ Ratings"
        lblDescription.text = comment
    }
    
}
