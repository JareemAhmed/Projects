//
//  HelperClass.swift
//  FirstProject
//
//  Created by TeamX Tec on 28/06/2024.
//

import Foundation

import Foundation
import UIKit
import Swift

//------------------------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------------------------//

///This custom label is use in whole app label
///It can automatically assign app font to label

//------------------------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------------------------//

class AppLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        if self.font!.isBold{
            self.font = Theme.getAppBoldFont(withSize: self.font!.pointSize)
        }else if self.font!.isMedium{
            self.font = Theme.getAppMediumFont(withSize: self.font!.pointSize)
        }else if self.font!.isSemiBold{
            self.font = Theme.getAppSemiBoldFont(withSize: self.font!.pointSize)
        }else{
            self.font = Theme.getAppFont(withSize: self.font!.pointSize)
        }
    }
}

class AppHeadingLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = .black
        self.font = Theme.getAppBoldFont(withSize: 25)
    }
}
class AppSimpleLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = Theme.purpleThemeColor
        self.font = Theme.getAppBoldFont(withSize: 12)
    }
}
class AppPlainBlackLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = .black
        self.font = Theme.getAppFont(withSize: 12)
    }
}
class AppSemiBoldWhiteLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = UIColor.white
        self.font = Theme.getAppSemiBoldFont(withSize: 14)
    }
}
class AppSimpleWhiteLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = UIColor.white
        self.font = Theme.getAppBoldFont(withSize: 12)
    }
}
class AppSimpleRegualarWhiteLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = UIColor.white
        self.font = Theme.getAppFont(withSize: 14)
    }
}
class AppBoldLargeWhiteLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = UIColor.white
        self.font = Theme.getAppBoldFont(withSize: 20)
    }
}
class AppHeadingBlackLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = .black
        self.font = Theme.getAppBoldFont(withSize: 18)
    }
}
class AppHeadingWhiteLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = .white
        self.font = Theme.getAppBoldFont(withSize: 18)
    }
}
class AppHeadingLargeBlackLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = .black
        self.font = Theme.getAppBoldFont(withSize: 24)
    }
}
class AppMediumSmallBlackLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = UIColor.black
        self.font = Theme.getAppMediumFont(withSize: 18)
    }
}
class AppSimpleBlackLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = .black
        self.font = Theme.getAppMediumFont(withSize: 15)
        self.contentScaleFactor = 0.4
        self.adjustsFontSizeToFitWidth = true
    }
}
class AppHeadingYellowLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = Theme.textYellowColor
        self.font = Theme.getAppBoldFont(withSize: 25)
    }
}
class AppMediumSmallYellowLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    func setFont(){
        self.textColor = Theme.appPink
        self.font = Theme.getAppMediumFont(withSize: 18)
    }
}
class AppHeadingMediumPurpleLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = Theme.purpleThemeColor
        self.font = Theme.getAppMediumFont(withSize: 20)
    }
}
class AppSimpleGreyLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = .lightGray
        self.font = Theme.getAppMediumFont(withSize: 12)
    }
}
class AppSmallYellowLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = Theme.textYellowColor
        self.font = Theme.getAppMediumFont(withSize: 9)
    }
}
class AppSimpleWhiteSmallLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = .white
        self.font = Theme.getAppBoldFont(withSize: 9)
    }
}
class AppSmallBlackLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = .black
        self.font = Theme.getAppBoldFont(withSize: UIDevice.current.userInterfaceIdiom == .pad ? 18 : 12)
    }
}
class AppSmallWhiteLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = .white
        self.font = Theme.getAppBoldFont(withSize: UIDevice.current.userInterfaceIdiom == .pad ? 18 : 12)
    }
}
class AppNormalYellowLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = Theme.textYellowColor
        self.font = Theme.getAppMediumFont(withSize: 15)
    }
}
class AppMediumWhiteLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = UIColor.white
        self.font = Theme.getAppBoldFont(withSize: 15)

    }
}
class AppNormalBlackLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = UIColor.black
        self.font = Theme.getAppMediumFont(withSize: 15)
    }
}
class AppMediumYellowLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = Theme.textYellowColor
        self.font = Theme.getAppBoldFont(withSize: 15)

    }
}
class AppMediumBlueLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = UIColor(named: "AccentColor")
        self.font = Theme.getAppBoldFont(withSize: 12)
    }
}

class AppMediumBlackLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.setFont()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setFont(){
        self.textColor = UIColor.black
        self.font = Theme.getAppMediumFont(withSize: UIDevice.current.userInterfaceIdiom == .pad ? 24 : 15)

    }
}

class AppMediumGreyLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    func setFont(){
        self.textColor = UIColor.systemGray2
        self.font = Theme.getAppMediumFont(withSize: UIDevice.current.userInterfaceIdiom == .pad ? 20 : 14)

    }
}

class AppSmallPurpleLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    func setFont(){
        self.textColor = Theme.purpleThemeColor
        self.font = Theme.getAppMediumFont(withSize: UIDevice.current.userInterfaceIdiom == .pad ? 18 : 14)

    }
}
class AppRegularPurpleLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    func setFont(){
        self.textColor = Theme.purpleThemeColor
        self.font = Theme.getAppFont(withSize: UIDevice.current.userInterfaceIdiom == .pad ? 18 : 12)

    }
}
class AppBoldPurpleLabel: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    func setFont(){
        self.textColor = Theme.purpleThemeColor
        self.font = Theme.getAppBoldFont(withSize: UIDevice.current.userInterfaceIdiom == .pad ? 18 : 18)

    }
}
