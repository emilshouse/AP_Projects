//
//  WeatherManager.swift
//  Clima
//
//  Created by Adnan Abdulai on 1/23/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=e1d864cc9cd8d2c86bde1876c932e0da&units=imperial"

    var delegate: WeatherManagerDelegate?

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }

    func performRequest(urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString) { // Don't want nil.
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather: weather)

                    }

                }
            }
            //4. Start the task
            task.resume()
        }

        func parseJSON(weatherData: Data) -> WeatherModel? {
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
                let name = decodedData.name
                let id = decodedData.weather[0].id
                let temp = decodedData.main.temp

                let weather = WeatherModel(conditionId: id, temp: temp, cityName: name)
                return weather

            } catch {
                print(error)
                return nil
            }

        }


    }

}
