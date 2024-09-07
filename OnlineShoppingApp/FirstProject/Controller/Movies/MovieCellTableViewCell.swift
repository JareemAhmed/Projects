//
//  MovieCellTableViewCell.swift
//  FirstProject
//
//  Created by TeamX Tec on 04/06/2024.
//

import UIKit
import SDWebImage
class MovieCellTableViewCell: UITableViewCell {

    @IBOutlet weak var lblView: UIView!
    @IBOutlet weak var lblMovieImg: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblView.roundView()
//        lblMovieImg.setBackground(imageName: "imgBg", contentMode: .sc)
        // Initialization code
    }
    func configureData(text: String,date: String,rating:String,image:String){
        lblMovieImg?.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "placeholder.png"))

        lblMovieName.text = text
        if let date = date.convertToSimpleDateString(){
            lblData.text = date
        }else{
            lblData.text = "No date"
        }
       
        lblRating.text = "\(rating)/5"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension UIImageView {
    
    // Function to set a background image
    func setBackground(imageName: String, contentMode: UIView.ContentMode = .scaleAspectFill) {
        // Set the image
        self.image = UIImage(named: imageName)
        
        // Set the content mode
        self.contentMode = contentMode
        
        // Ensure the image view is behind all other subviews
        self.superview?.sendSubviewToBack(self)
    }
}
