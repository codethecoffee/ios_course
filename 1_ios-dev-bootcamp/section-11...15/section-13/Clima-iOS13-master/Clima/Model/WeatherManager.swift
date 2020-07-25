//
//  WeatherManager.swift
//  Clima
//
//  Created by Suzy Lee on 7/24/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation


// By convention, we declare the protocol in the SAME FILE as the struct/class that will use it
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=822ab112f2a3d357a27c9c0ea578659f&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    /**
     Fetch the current weather given a city name.
     - parameter cityName: The city  the user types in the search bar of the weather app.
     */
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    /**
     Fetch the current weather given the geographic coordinates of a location.
     - parameter latitude: Latitude of the device's current location.
     - parameter longitude: Longitude of the device's current location.
     */
    func fetchWeather(latitude: Double, longitude: Double) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    /**
     Carry out the HTTP Request
     */
    func performRequest(with urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give URLSession a task.
            
            // There are multiple different versions of the dataTask method
            // This one retrieves the contents from the url, and then fires a completionHandler
            // after successfully fetching said data.
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        // Tell WeatherViewController delegate that we got weather info!
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            //4. Start the task to trigger the entire networking process
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        // An object that decodes JSON
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let description = decodedData.weather[0].description
            print("Description: ", description)
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, condDescription: description)
            return weather
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
