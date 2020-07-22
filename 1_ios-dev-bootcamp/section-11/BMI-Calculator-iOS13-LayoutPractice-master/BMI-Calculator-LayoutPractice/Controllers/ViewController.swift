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
    
    // Create IBOutlet so you can access the values of the sliders
    // in calculateBMI function
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
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
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi: Float = weight / pow(height, 2)        
        
        // Transition to the second view
        let secondVC = SecondViewController()
        secondVC.bmiValue = String(format: "%.1f", bmi)
        
        self.present(secondVC, animated: true, completion: nil)
        
    }
    

}

