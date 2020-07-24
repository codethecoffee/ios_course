//
//  main.swift
//  Protocols and Delegates
//
//  Created by Suzy Lee on 7/24/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

import Foundation


/**
 In order to have the Advanced Life Support certificate, you must know how to perform CPR.
 */
protocol AdvancedLifeSupport {
    func performCPR()
}

/**
 EmergencyCallHandler does not need to know the specific instance of its delegate property
 thanks to the delegate design pattern.
 */
class EmergencyCallHandler {
    // Whoever is set as the delegate must have Advanced Life Support certificate
    // This delegate can be any paramedic; we don't need to know the exact instance
    // thanks to this delegate design pattern.
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    init (handler: EmergencyCallHandler) {
        // Setting themselves as the delegate of the emergency call handler
        // Equivalent of putting themself on call
        handler.delegate = self
    }
    
    func performCPR() {
        print("Current parademic (delegate) performs CPR!")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compressions.")
    }
    
    func useStethescope() {
        print("Listening to cool heart sounds")
    }
}

// Surgeon inherits the AdvancedLifeSupport protocol as well
class Surgeon: Doctor {
    
    override func performCPR() {
        super.performCPR() // Inherit what the doctor does in performing CPR
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill() {
        print("Whirr....")
    }
}

let emilio = EmergencyCallHandler()
let pete = Paramedic(handler: emilio)

emilio.assessSituation() // Emilio assess the situation
// Emilio determines that it is a medical emergency
emilio.medicalEmergency() // This calls delegate.performCPR()
// pete will perform CPR!


let mark = Surgeon(handler: emilio)
emilio.medicalEmergency()
