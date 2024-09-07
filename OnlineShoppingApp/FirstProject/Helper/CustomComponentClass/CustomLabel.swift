//
//  CustomLabel.swift
//  FirstProject
//
//  Created by TeamX Tec on 13/04/2024.
//

import UIKit

class CustomLabelBlue: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    func setFont(){
        self.textColor = Theme.appBlue
        self.font = Theme.getAppBoldFont(withSize: UIDevice.current.userInterfaceIdiom == .pad ? 30 : 30)

    }
}
class CustomLabelBlack: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    func setFont(){
        self.textColor = Theme.appBlack
        self.font = Theme.getAppBoldFont(withSize: UIDevice.current.userInterfaceIdiom == .pad ? 16 : 16)

    }
}
