//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var selectedTip: Float = 0.1
    var splitNum: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        zeroPctButton.tag = 0
        tenPctButton.tag = 10
        twentyPctButton.tag = 20
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        let newTip = Float(sender.tag) / Float(100)
        self.selectedTip = newTip
        
        UIUpdate()
        sender.isSelected = true
        
    }
    
    func UIUpdate() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    @IBAction func splitValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        self.splitNum = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("Selected tip: \(self.selectedTip)")
        print("Split amongst: \(self.splitNum)")
    }
}

