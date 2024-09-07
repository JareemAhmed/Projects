//
//  CarPartsDetailsCell.swift
//  FinaliOSJareemAbbasi
//
//  Created by Apple on 8/19/24.
//

import UIKit

class CarPartsDetailsCell: UITableViewCell {
    
    @IBOutlet weak var carPartImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
