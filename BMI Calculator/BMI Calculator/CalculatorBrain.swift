//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Adnan Abdulai on 12/10/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var backgroundColor: UIColor
    var bmi: Float?


    mutating func calculateBMI(height: Float, weight: Float) {
        bmi = weight / (height * height)

    }

    func getBMIValue() -> String {
        guard let bmi = bmi else { return "Error" }
         let bmiTo1DecimalPlace = String(format: "%.1f", bmi)

        return bmiTo1DecimalPlace
    }

}
