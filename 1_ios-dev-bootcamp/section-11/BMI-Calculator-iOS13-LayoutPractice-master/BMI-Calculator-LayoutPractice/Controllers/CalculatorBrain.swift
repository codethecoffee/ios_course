//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Suzy Lee on 7/22/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    // Good practice to make this property an Optional, bc initially we won't have a BMI
    var currBMI: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            self.currBMI = BMI(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
        else if bmiValue <= 24.9 {
            self.currBMI = BMI(value: bmiValue, advice: "You're at a healthy weight, keep it up!", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        }
        else {
            self.currBMI = BMI(value: bmiValue, advice: "Might have to cut down on the pies.", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
    
    func getBMIValue() -> Float {
        return self.currBMI?.value ?? 0.0
    }
    
    func getAdvice() -> String {
        return self.currBMI?.advice ?? "Invalid BMI"
    }
    
    func getColor() -> UIColor {
        return self.currBMI?.color ?? UIColor.black
    }
    
}
