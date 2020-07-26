//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func selectCurrency(_ exchangeRate: Double, selectedCurr: String)
    func didFailWithError(_ error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "FC4B0B6D-8ED6-4725-94CC-F6A5BF2C1734"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    /**
     Calculate the price of Bitcoin in the selected currency.
     
     - parameter currency: The currency selected in the UIPicker on the home page
     */
    func getCoinPrice(for currency: String) {
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: url)
    }
    
    /**
     Carry out the HTTP Request to Coin API
     */
    func performRequest(with urlString: String) {
        // 1. Create a URL object
        if let url = URL(string: urlString) {
            // 2. Create a URLSession (a.k.a. connection to the URL)
            // Most of the time, you just have to leave it as the default configuration.
            let session = URLSession(configuration: .default)
            // 3. Assign a task to this session
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    let parsedData = self.parseJSON(safeData)
                    let exchangeRate = parsedData?.rate
                    let currency = parsedData?.asset_id_quote
                    self.delegate?.selectCurrency(exchangeRate ?? -1, selectedCurr: currency ?? "N/A")
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    /**
     Parse JSON data using the CoinData struct.
     - parameter data: Data object retrieved from HTTP request
     */
    func parseJSON(_ data: Data) -> CoinData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
