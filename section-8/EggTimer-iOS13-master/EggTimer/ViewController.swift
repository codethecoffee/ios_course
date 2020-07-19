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
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    let eggTimes: [String: Float] = ["soft": 3.0, "medium": 4.0, "hard": 7.0]
    var secondsLeft: Float = 0
    var currHardness: String = ""
    var totalTime: Float = 0
    
    // Declare an instance of Timer() so you can access it
    // in other functions like updateTimer()
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        currHardness = sender.currentTitle!.lowercased()
        
        totalTime = eggTimes[currHardness]!
        secondsLeft = eggTimes[currHardness]!
        
        // selector: Function called for every timeInterval (in this case, every second)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

    }
    
    // @objc exposes the block of code to Objective-C code.
    // All of UIKit requires this
    @objc func updateTimer() {
        if secondsLeft > 0 {
            print("\(secondsLeft) seconds left")
            secondsLeft -= 1
            progressBar.progress = (totalTime - secondsLeft) / totalTime
        }
        else {
            print("Done")
            countdownLabel.text! = "Done!"
            
            // Invalidate method prevents updateTimer()
            // from being called indefinitely
            timer.invalidate()
        }
    }
    
    
}
