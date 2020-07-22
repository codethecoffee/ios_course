//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Suzy Lee on 7/22/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var totalPerPerson: Float = 0.0
    var numSplit: Float = 2
    var tip: Float = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(self.totalPerPerson)
        subtitleLabel.text = "Split between " + String(numSplit) + "people, with " + String(tip) + "tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
