//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Adnan Abdulai on 12/10/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {

    var bmi: BMI?

    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)

        var bmiAdvice = ""
        var bmiColor: UIColor

        switch bmiValue {
        case ...18.5:
            bmiAdvice = "Eat more food."
            bmiColor = .blue
        case 18.5..<25:
            bmiAdvice = "Fit."
            bmiColor = .green
        case 25...:
            bmiAdvice = "Eat less food. "
            bmiColor = .red
        default:
            bmiAdvice = "Error"
            bmiColor = .orange
        }

        bmi = BMI(value: bmiValue, advice: bmiAdvice, color: bmiColor)

    }

    func getBMIValue() -> String {
      //  guard let bmi = bmi else { return "Error" }
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)

        return bmiTo1DecimalPlace
    }

    func getAdvice() -> String {
        return bmi?.advice ?? "Error"
    }

    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }

}


