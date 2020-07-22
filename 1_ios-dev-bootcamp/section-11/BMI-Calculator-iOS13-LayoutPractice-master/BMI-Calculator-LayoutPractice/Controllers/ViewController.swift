//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        print("Current height: " + String(format: "%.1f", sender.value))
        heightLabel.text = String(format: "%.1f", sender.value)
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        print("Current weight: \(Int(sender.value))")
        weightLabel.text = String(Int(sender.value))
    }
    

}

