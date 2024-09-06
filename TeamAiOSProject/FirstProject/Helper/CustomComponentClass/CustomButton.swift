//
//  CustomButton.swift
//  FirstProject
//
//  Created by TeamX Tec on 13/04/2024.
//

import Foundation

import UIKit

//class AppBlueBorderButton : UIButton {
//    
//    var currentGradient: Int = 0
//    let gradientNext = CAGradientLayer()
//    let gradientPrevious = CAGradientLayer()
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        self.commmonIntialize()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        self.commmonIntialize()
//    }
//    override func draw(_ rect: CGRect) {
//        addGradient()
//    }
//    func commmonIntialize() {
//        self.titleLabel?.font = UIFont.init(name: "Poppins-Regular", size: 15)
//        self.layer.cornerRadius = self.frame.height/2
//        self.clipsToBounds = true
//        self.setTitleColor(UIColor(red: 2.0/255.0, green: 10.0/255.0, blue: 83/255.0, alpha: 1.0), for: .normal)
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor(red: 2.0/255.0, green: 10.0/255.0, blue: 83/255.0, alpha: 1.0).cgColor
//        
//    }
//    
//    private func addGradient() {
//        self.backgroundColor = .clear
//        
//    }
//}
//class AppWhiteBackgroundButton : UIButton {
//    
//    var currentGradient: Int = 0
//    let gradientNext = CAGradientLayer()
//    let gradientPrevious = CAGradientLayer()
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        self.commmonIntialize()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        self.commmonIntialize()
//    }
//    override func draw(_ rect: CGRect) {
////        addGradient()
//    }
//    func commmonIntialize() {
//        
//        self.titleLabel?.font = UIFont.init(name: "Poppins-Regular", size: 15)
//        self.layer.cornerRadius = self.frame.height/2
//        self.clipsToBounds = true
//        self.setTitleColor(Theme.purpleThemeColor, for: .normal)
//        self.backgroundColor = UIColor.white
//        self.showsTouchWhenHighlighted = true
//        
//        
//    }
//    
//    private func addGradient() {
//        self.backgroundColor = Theme.purpleThemeColor
//        
//    }
//}
class AppBlueBackgroundButton : UIButton {
    
    var currentGradient: Int = 0
    let gradientNext = CAGradientLayer()
    let gradientPrevious = CAGradientLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commmonIntialize()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commmonIntialize()
    }
    override func draw(_ rect: CGRect) {
//        addGradient()
    }
    func commmonIntialize() {
        
        self.titleLabel?.font = Theme.getAppSemiBoldFont(withSize: 20)
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        self.setTitleColor(UIColor.white, for: .normal)
        self.backgroundColor = Theme.appBlue
       // self.showsTouchWhenHighlighted = true
        
        
    }
    
    private func addGradient() {
        self.backgroundColor = Theme.textYellowColor
        
    }
}
class AppYellowBackgroundButton : UIButton {
    
    var currentGradient: Int = 0
    let gradientNext = CAGradientLayer()
    let gradientPrevious = CAGradientLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commmonIntialize()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commmonIntialize()
    }
    override func draw(_ rect: CGRect) {
//        addGradient()
    }
    func commmonIntialize() {
        
        self.titleLabel?.font = Theme.getAppSemiBoldFont(withSize: 20)
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        self.setTitleColor(UIColor.white, for: .normal)
        self.backgroundColor = Theme.textYellowColor
       // self.showsTouchWhenHighlighted = true
        
        
    }
    
    private func addGradient() {
        self.backgroundColor = Theme.appGreen
        
    }
}

