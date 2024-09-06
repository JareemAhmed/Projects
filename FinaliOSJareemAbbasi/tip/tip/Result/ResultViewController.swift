//
//  ResultViewController.swift
//  tip
//
//  Created by Apple on 4/20/24.
//

import UIKit


class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    typealias completionHandler = (String) -> Void
    var result = "0.0"
    var tip1 = 10
    var split = 2
    let VC = ViewController()
    var complition: completionHandler?

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip1)% tip."

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        guard let completionBlock = complition else { return }
        completionBlock(result)
    }
}
