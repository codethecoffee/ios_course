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
    var splitNum: Float = 2
    var billTotal: Float = 0.0
    var totalPerPerson: Float = 0.0
    
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
        
        // Dismisses the keyboard if it's open
        billTextField.endEditing(true)
        
    }
    
    func UIUpdate() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    @IBAction func splitValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        self.splitNum = Float(sender.value)
        
        // Dismisses the keyboard if it's open
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let billNum = Float(billTextField.text!)
        
        let unsplitTotal = (billNum ?? 0.0) + selectedTip*(billNum ?? 0.0)
        self.totalPerPerson = unsplitTotal / splitNum
        
        // Transition to Results view on click
        self.performSegue(withIdentifier: "goToResults", sender: self)

    }
    
    /**
     Function triggered whenever self.performSegue is called.
     This same function is called even if there are multiple different segues.

     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Make sure you are using the correct segue
        if segue.identifier == "goToResults" {
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.totalPerPerson = self.totalPerPerson
            resultsVC.tip = self.selectedTip
            resultsVC.numSplit = self.splitNum
        }
        
        
    }
}

