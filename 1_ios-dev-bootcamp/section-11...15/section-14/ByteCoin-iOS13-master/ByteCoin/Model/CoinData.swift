//
//  CoinData.swift
//  ByteCoin
//
//  Created by Suzy Lee on 7/26/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

/**
 Struct used to decode JSON data from GET request to Coin API
 */
struct CoinData: Codable {
    let asset_id_base: String // BTC
    let asset_id_quote: String // User's selected currency
    var rate: Double // Exchange rate to selected currency
}
