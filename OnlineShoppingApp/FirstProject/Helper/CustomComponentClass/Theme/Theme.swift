//
//  Theme.swift
//  FirstProject
//
//  Created by TeamX Tec on 13/04/2024.
//

import Foundation
import UIKit
class Theme {
    
    static var placeHolderColor : UIColor { return UIColor(red: 113.0/255.0, green: 113.0/255.0, blue: 113.0/255.0, alpha: 1.0) }
    static var appColor = #colorLiteral(red: 0.007843137255, green: 0.03921568627, blue: 0.3254901961, alpha: 1)
    static var appBlue = #colorLiteral(red: 0.1215686275, green: 0.2549019608, blue: 0.5450980392, alpha: 1)
    static var appBlack = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static var appGreen = #colorLiteral(red: 0.168627451, green: 0.7843137255, blue: 0.01960784314, alpha: 1)
    static var appWhite = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static var redBorderColor : UIColor { return UIColor(red: 198.0/255.0, green: 46.0/255.0, blue: 39/255.0, alpha: 1.0) }
    static var appDarkGrey = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    static var appLightGrey = #colorLiteral(red: 0.8980000019, green: 0.8980000019, blue: 0.9179999828, alpha: 1)
    static var gameStartBg = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.27)
    static var purpleThemeColor = #colorLiteral(red: 0.6235294118, green: 0.5058823529, blue: 0.7921568627, alpha: 1)
    static var appPink = #colorLiteral(red: 0.9529411765, green: 0.8, blue: 0.8039215686, alpha: 1)
    static var textYellowColor : UIColor { return UIColor(red: 255.0/255.0, green: 194.0/255.0, blue: 0/255.0, alpha: 1.0) }
    static var lightGreyColor : UIColor { return UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0) }
    static func getAppFont(withSize: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Regular", size: withSize)!
    }
    static func getAppMediumFont(withSize: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Medium", size: withSize)!
    }
    static func getAppSemiBoldFont(withSize: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-SemiBold", size: withSize)!
    }
    static func getAppBoldFont(withSize: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Bold", size: withSize)!
    }
    
}
/// Theme class to handle colors in app.

enum AssetsColor : String {
    case PlaceholderColor
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
}
