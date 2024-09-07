//
//  SplashViewController.swift
//  FirstProject
//
//  Created by TeamX Tec on 13/04/2024.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func loginAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

