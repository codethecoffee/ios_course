//
//  why we need protocols.swift
//  Protocols Demo
//
//  Created by Suzy Lee on 7/23/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

/**
 A swift code file showing why we need protocols. Relying on class inheritance can get very messy.
 
 The premise: We own a flying museum, where we demo flying birds. We, quite reasonably, start off by
 declaring a Bird class. All Birds can lay eggs (if female) and fly. We start creating subclasses for more
 specific kinds of birds, and it works great so far for the Eagle.
 
 However, now we're going to show penguins as well (don't question it), and now penguins can fly because
 they're inheriting from the class Bird!
 
 Our flying demos are a huge success so we decide to show demos of flying objects as well. The flyingDemo
 method only takes Bird objects, thus we're forced to define our Plane class as a subclass of Bird. Now,
 because of this, planes can lay eggs! What a mess.
 
 */

import Foundation

class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("The bird makes a new bird!")
        }
    }
    
    func fly() {
        print("The bird flaps its wings and lifts off into the sky.")
    }
}

class Eagle: Bird {
    
    func soar() {
        print("The eagle glides in the air. Not all birds can do this.")
    }
    
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles through the waater. Only penguins can do this.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: Bird) {
        flyingObject.fly()
    }
}

// We want to now show airplanes in the flying demo!
class Airplane: Bird {
    override func fly() {
        print("The airplane uses its engine to lift into the air.")
    }
}


let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()
myEagle.soar()

let myPenguin = Penguin()
myPenguin.layEgg()
myPenguin.swim()
// We want penguin to be a subtype of Bird, but we don't want it to be able to fly.
myPenguin.fly()


let myPlane = Airplane()

let museum = FlyingMuseum()

// Because a penguin is a Bird object, you can also pass in a myPenguin object!
// We're relying TOO MUCH on class inheritance.
museum.flyingDemo(flyingObject: myPenguin)
