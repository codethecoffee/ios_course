//
//  main.swift
//  Protocols Demo
//
//  Created by Suzy Lee on 7/23/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

import Foundation

/**
 Protocol that applies to all objects (both bird and non-bird) that can fly
 */
protocol CanFly {
    // Protocol methods do not any implementation (it throws an error if you add {}
    func fly()
}

class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("The bird makes a new bird!")
        }
    }
    
    // Remove fly() method from Bird class, since not all birds can fly (e.g., penguins)
}

// Birds that can fly will adopt the CanFly protocol.
// Chain protocols to class after listing the superclass (if one exists)
class Eagle: Bird, CanFly {
    func fly() {
        print("The eagle flaps its wing and lifts off into the sky.")
    }
    
    func soar() {
        print("The eagle glides in the air. Not all birds can do this.")
    }
    
}

// Bird does not adopt the CanFly protocol
class Penguin: Bird {
    func swim() {
        print("The penguin paddles through the waater. Only penguins can do this.")
    }
}

// Airplane no longer needs to be a class because it isn't a subclass of the Bird class
// Turn it back into a struct; it's better practice to use structs unless inheritance
// is strictly necessary
struct Airplane: CanFly {
    func fly() {
        print("The airplane uses its engine to lift into the air.")
    }
}

struct FlyingMuseum {
    /**
     A method that takes any object that adheres to the CanFly protocol.
     You aren't limited to a specific class/struct of objects! You can pass
     protocols like data types.
     */
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

let myEagle = Eagle()
let myPenguin = Penguin()
let myPlane = Airplane()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myPlane)
museum.flyingDemo(flyingObject: myEagle)

// Line below triggers error "Argument type Penguin does not conform to expected type 'CanFly'"
// museum.flyingDemo(flyingObject: myPenguin)
