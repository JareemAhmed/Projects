//
//  Extensions.swift
//  FirstProject
//
//  Created by TeamX Tec on 14/04/2024.
//

import Foundation
import UIKit
extension UIViewController : UIGestureRecognizerDelegate{
    
    func backBarButton() -> UIBarButtonItem {
        
        self.swipeToPopEnable()
        let backButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(BackButtonTapped))
        return backButtonItem
    }
    ///Back Btn Action
    @objc public func BackButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    /// THIS FUNCTION WILL REMOVE DEFAULT BACK GESTURE
    public func swipeToPopDisable() {
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    /// THIS GESTURE WILL ENABLE / ADD DEFAULT BACK GESTURE
    public func swipeToPopEnable() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
    }
}
extension UserDefaults {
    private var ud:UserDefaults {
        return UserDefaults.standard
    }
    
    var userImage: String {
        get {
            return UserDefaults.standard.string(forKey: "user_image") ?? ""
        }set {
            UserDefaults.standard.set(newValue, forKey: "user_image")
        }
    }
    var userPass: String {
        get {
            return UserDefaults.standard.string(forKey: "pass") ?? ""
        }set {
            UserDefaults.standard.set(newValue, forKey: "pass")
        }
    }
    var userName: String {
        get {
            return UserDefaults.standard.string(forKey: "userName") ?? ""
        }set {
            UserDefaults.standard.set(newValue, forKey: "userName")
        }
    }
    var userPhone: String {
        get {
            return UserDefaults.standard.string(forKey: "userPhone") ?? ""
        }set {
            UserDefaults.standard.set(newValue, forKey: "userPhone")
        }
    }
        var userEmail: String {
            get {
                return UserDefaults.standard.string(forKey: "userEmail") ?? ""
            }set {
                UserDefaults.standard.set(newValue, forKey: "userEmail")
            }
        }
        var userJob: String {
            get {
                return UserDefaults.standard.string(forKey: "userJob") ?? ""
            }set {
                UserDefaults.standard.set(newValue, forKey: "userJob")
            }
        }
    var userLucky: Int {
        get {
            return UserDefaults.standard.integer(forKey: "userLucky") 
        }set {
            UserDefaults.standard.set(newValue, forKey: "userLucky")
        }
    }
}
extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}

extension UIFont {
    
    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }
    
    var isMedium: Bool {
        if(fontName.contains("Medium")){
            return true
        }else{
            return false
        }
    }
    
    var isRegular: Bool {
        if(fontName.contains("Regular")){
            return true
        }else{
            return false
        }
    }
    var isSemiBold: Bool {
        if(fontName.contains("Semi")){
            return true
        }else{
            return false
        }
    }
    
}

extension UIView{
    
    func roundView(radius : CGFloat = 6,bgColor:UIColor =
                   UIColor.systemGray){
        self.backgroundColor = UIColor.systemGray
        self.layoutIfNeeded()
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}



extension String {
    func convertToSimpleDateString() -> String? {
        let iso8601Formatter = DateFormatter()
        iso8601Formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        iso8601Formatter.timeZone = TimeZone(secondsFromGMT: 0)
        iso8601Formatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let date = iso8601Formatter.date(from: self) else {
            return nil
        }

        // Use another DateFormatter to convert the Date object to the "yyyy-MM-dd" format
        let simpleDateFormatter = DateFormatter()
        simpleDateFormatter.dateFormat = "yyyy-MM-dd"
        simpleDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        simpleDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        return simpleDateFormatter.string(from: date)
    }
}


