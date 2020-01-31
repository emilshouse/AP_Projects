//
//  WeatherModel.swift
//  Clima
//
//  Created by Adnan Abdulai on 1/30/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let temp: Double
    let cityName: String

    var tempString: String {
        return String(format: "%.1f", temp)
    }

    var conditionName: String {
        switch conditionId {
        case 200...299:
            return "cloud.heavyrain"
        case 300...399:
            return "cloud.drizzle"
        case 500...599:
            return "cloud.rain"
        case 600...699:
            return "snow"
        case 700...799:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "icloud.slash"
        }
    }

}
