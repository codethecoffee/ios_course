//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    var currStory: Int = 0
    
    let stories: [Story] = [
        Story(title: "You see a fork in the road",
              choice1: "Take a left.",
              choice2: "Take a right."),
        Story(title: "You see a tiger.",
              choice1: "Shout for help.",
              choice2: "Play dead."),
        Story(title: "You find a treasure chest.",
              choice1: "Open it.",
              choice2: "Check for traps.")]
    
    /**
     Based on the user choice, figure out what the next story is and
     update properties accordingly.
     
     - parameter userChoice: The choice made by the user
     
     */
    mutating func nextStory(userChoice: String) {
        switch userChoice {
        case "Take a left.":
            self.currStory = 1
        case "Take a right.":
            self.currStory = 2
        default:
            print("Error")
        }
    }
    
    /**
    Method that returns the story object the player is currently on.
     
     - returns: The Story object the player is currently on.
     */
    func getCurrStory() -> Story {
        return stories[currStory]
    }
    
    
}
