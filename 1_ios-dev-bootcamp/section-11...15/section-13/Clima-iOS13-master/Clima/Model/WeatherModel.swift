//
//  WeatherModel.swift
//  Clima
//
//  Created by Suzy Lee on 7/25/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    // STORED properties
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let condDescription: String
    
    // COMPUTED properties
    // Based on weather condition code, calculate name of SF icon to display
    // Accessed just like a normal property (weather.conditionName)
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.heavyrain"
        case 600...622:
            return "cloud.snow"
        case 701...771:
            return "cloud.fog"
        case 781:
            return "tornado"
        case 800:
            return "sun.min"
        case 801...804:
            return "cloud.sun"
        default:
            return "sun.min"
        }
    }
    
    // Temperature formatted to be put in the temp label of interface
    var temperatureString: String {
        return String(format: "%.1f", self.temperature)
    }

}
