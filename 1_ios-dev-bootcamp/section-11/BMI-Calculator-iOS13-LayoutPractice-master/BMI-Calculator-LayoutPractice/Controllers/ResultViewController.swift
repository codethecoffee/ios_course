//
//  ResultViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Suzy Lee on 7/22/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmi: Float = 0.0
    var advice: String = ""
    var color: UIColor?
    
    @IBOutlet weak var backgroundColor: UIImageView!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = String(format: "%.1f", bmi)
        backgroundColor.backgroundColor = color
        adviceLabel.text = advice

    }
    
    /**
     Return to the original screen
     */
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        // Dismiss the second view upon pressing recalculate
        self.dismiss(animated: true, completion: nil)
        
    }

}
