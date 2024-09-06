//
//  Enums.swift
//  FirstProject
//
//  Created by TeamX Tec on 04/06/2024.
//

import Foundation
import UIKit

enum CellIdentifires:String{
    case movieCell = "MovieCellTableViewCell"
    case reviewCell = "ReviewsViewCell"
}
enum StoryboardIdentifires{
    
}
enum ApiType: String{
    case POST
    case GET
    case PUT
    case DELETEturn
        
}

enum Validation {
    case none
    case general
    case name
    case email
    case password
    case normal_password
    case phone
    case emailOrNumber
    case matchPass
    case iban
   // case card
}

enum Images: String{
    case viewBg = "viewBg"
    case icStarFilled = "ic_star_filled"
    case icStarEmpty = "ic_star_empty"
    case icAdd = "plus"
    var name:String{
        get{
            return rawValue
        }
    }
    
    var image:UIImage{
        get{
            return UIImage(named: rawValue) ?? UIImage()
        }
    }
}
enum Colors : String{
     case imageBg = "#6E1092"
}
