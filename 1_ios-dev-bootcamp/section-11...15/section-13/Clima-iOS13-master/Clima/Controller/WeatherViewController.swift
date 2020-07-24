//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    // Can use icons from SF Symbols for iOS13+
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The text field reports back to WeatherViewController
        searchTextField.delegate = self
    }
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        print(searchTextField.text ?? "No city entered")
        
        // Dismisses the keyboard upon pressing search button
        searchTextField.endEditing(true)
        
    }
    
    /**
     Function that is fired when the the return button on the keyboard is pressed
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text ?? "No city entered")
        
        // Dismisses the keyboard upon pressing return
        searchTextField.endEditing(true)

        // Return true if the keyboard should indeed return upon press
        return true
    }
    
    /**
     Function triggered when user tries to deselect the text field. Useful for doing validation on what the user typed
     */
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        // Valid input
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Invalid city name"
            // Returns false, so we don't proceed further
            return false
        }
    }
    
    
    /**
     Function triggered when user is done editing a UI Text field
     */
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Only fetch weather if we have a valid string (unwrap Optional)
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        // This clears the search bar once you search
        searchTextField.text = ""
    }
    

    

}

