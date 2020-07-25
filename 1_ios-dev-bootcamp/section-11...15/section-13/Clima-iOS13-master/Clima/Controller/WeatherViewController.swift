//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conditionDescription: UILabel!
    
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    // Remember to set the current view controller as the delegate in viewDidLoad()
    // Forgetting to do this is a common error
    override func viewDidLoad() {
        super.viewDidLoad()
        // The text field reports back to WeatherViewController
        searchTextField.delegate = self
        // The weather manager reports back to WeatherViewController
        weatherManager.delegate = self
        // The location manager reports back to WeatherViewController
        locationManager.delegate = self
        
        // Shows a pop-up that asks the user for permission
        locationManager.requestWhenInUseAuthorization()
        
        // Request once for the location.
        // If you need constant updates on location, use startUpdatingLocation() instead
        locationManager.requestLocation()
        
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        // requestLocation will only be executed if there has been a change
        // in the user's location, or if the location manager was deactivated
        // and had to be reactivated by this call
        
        // TLDR: without the line `locationManager.stopUpdatingLocation()`
        // in locationManager, this line of code would not work
        locationManager.requestLocation()
    }
    
}

// MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
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

// MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    // It's common practice to pass in the identity of the object that calls the delegate
    // method into a delegate method. In our case, this would be the weatherManager.
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        // UI updates that depend on completion handlers (async requests)
        // must be wrapped with Dispatch Queue
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
            self.conditionDescription.text = weather.condDescription
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

// MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // TIP: The last location in [CLLocation] will be the most updated/accurate one
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude            
            weatherManager.fetchWeather(latitude: lat, longitude: long)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error)")
    }
}
