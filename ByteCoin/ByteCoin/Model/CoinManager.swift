//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFindCurrency(_ coinManager: CoinManager, currency: CurrencyModel)
    func didFailwithError(error: Error)

}

struct CoinManager {


    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","GHS","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let key = "OGRiMjY2ZDJiM2JkNGVhNjg0MzlkYjM4MjkyYTVhOTI"

    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)\(currency)"
        performRequest(urlString: urlString)
    }


    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.setValue(key, forHTTPHeaderField: "x-ba-key")

            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailwithError(error: error!)
                }

                if let safeData = data {
                    if let currency = self.parseJSON(safeData) {
                        self.delegate?.didFindCurrency(self, currency: currency)
                    }
                }
            }
            task.resume()

        }

    }

    func parseJSON(_ data: Data) -> CurrencyModel? { // Watch this video again.
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.last
            //   let name = decodedData.display_symbol



            let currencyModel = CurrencyModel(lastPrice: lastPrice)

            return currencyModel
        } catch {
            delegate?.didFailwithError(error: error)
            return nil

        }
    }


    
}
