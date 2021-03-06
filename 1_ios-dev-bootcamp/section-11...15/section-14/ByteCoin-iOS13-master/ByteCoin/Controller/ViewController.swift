//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set current view controller as data source for the picker
        currencyPicker.dataSource = self
        // UIPickerView will communicate with ViewController
        currencyPicker.delegate = self
        
        // Coin Manager can now communicate with ViewController
        coinManager.delegate = self
    }
    
    
}

// MARK: - UIPickerViewDataSource & UIPickerViewDelegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    /**
     Determines the number of columns to be in the UIPickerView
     */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /**
     Determines the number of rows to show in the UIPickerView.
     
     We don't have time to count the number of kinds of currency. Let's make the CoinManager
     do that calculation for us.
     */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    /**
     This function will be called once for every row, so that it knows what to populate each
     row with.
     */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurr = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurr)
        
    }
    
}


// MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate {
    /**
     Updates the UI with the appropriate exchange rate once the user selects a currency.
     
     - parameter exchangeRate: Exchange rate selected on UIPicker
     */
    func selectCurrency(_ exchangeRate: Double, selectedCurr: String) {
        // Make sure UI updates are done asynchronously (after we can result from API call)
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format:"%.0f", exchangeRate)
            self.currencyLabel.text = selectedCurr
        }
    }
    
    /**
     Something went wrong in selecting the currency and making the API call.
     */
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
}
