//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var storyText: UILabel!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        option1Button?.titleLabel!.numberOfLines = 0;
        option2Button?.titleLabel!.numberOfLines = 0;

        updateUI()
    }
    
    
    @IBAction func chooseOption(_ sender: UIButton) {
        let selectedOpt = sender.titleLabel!.text!
        print(selectedOpt)
        
        // Progress to the next story
        storyBrain.nextStory(userChoice: selectedOpt)
        updateUI()
    }
    
    func updateUI() {
        let currStory = storyBrain.getCurrStory()
        
        storyText.text = currStory.title
        option1Button.setTitle(currStory.choice1, for:.normal)
        option2Button.setTitle(currStory.choice2, for:.normal)
    }
    

}

