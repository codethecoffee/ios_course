//
//  WeatherManager.swift
//  Clima
//
//  Created by Suzy Lee on 7/24/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=822ab112f2a3d357a27c9c0ea578659f&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    /**
     Carry out the actual networking process.
     */
    func performRequest(urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give URLSession a task.
            
            // There are multiple different kinds of dataTask methods.
            // This one retrieves the contents from the url, and then fires a completionHandler
            // after successfully fetching said data.
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    // Data objects aren't as printable as strings; need to convert
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                }
            }
            
            //4. Start the task to trigger the entire networking process
            task.resume()
        }
    }
    
    
    // Note: It's better programming practice to pass in a closure as the completionHandler instead.
    // That's why I commented this out.
    //    func handle(data: Data?, response: URLResponse?, error: Error?) {
    //        // If there's an error, print it and exit out of the function
    //        if error != nil {
    //            print(error!)
    //            return
    //        }
    //
    //        if let safeData = data {
    //            // Data objects aren't as printable as strings; need to convert
    //            let dataString = String(data: safeData, encoding: .utf8)
    //            print(dataString!)
    //        }
    //
    //    }
    
    
}
