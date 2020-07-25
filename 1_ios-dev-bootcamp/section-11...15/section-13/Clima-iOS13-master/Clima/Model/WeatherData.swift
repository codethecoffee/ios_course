//
//  WeatherData.swift
//  Clima
//
//  Created by Suzy Lee on 7/24/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

// Note: You cannot code the property names whatever you want; they must match with what you have
// in your JSON data precisely in order for the decoding to work.

// Decodable Protocol: A type that can decode itself from an external representation (e.g., JSON)

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int // Weather condition code
    let description: String
}
