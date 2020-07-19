//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countdownLabel: UILabel!
    
    let eggTimes = ["soft": 3, "medium": 4, "hard": 7]
    var secondsLeft = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!.lowercased()
        
        secondsLeft = eggTimes[hardness]!
        
        // selector: Function called for every timeInterval (in this case, every second)
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

    }
    
    // @objc exposes the block of code to Objective-C code.
    // All of UIKit requires this
    @objc func updateTimer() {
        if secondsLeft > 0 {
            print("\(secondsLeft) seconds left")
            secondsLeft -= 1
        }
        else {
            print("Done")
            countdownLabel.text! = "Done!"
        }
    }
    
    
}
