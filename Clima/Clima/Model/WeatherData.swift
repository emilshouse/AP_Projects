//
//  WeatherData.swift
//  Clima
//
//  Created by Adnan Abdulai on 1/30/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let base: String
    let visibility: Int?
    let cod: Int


}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double

}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String

}
