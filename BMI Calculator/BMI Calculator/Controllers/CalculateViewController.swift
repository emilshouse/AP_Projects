//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

//    var bmiValue = "0.0"
    var calculatorBrain = CalculatorBrain()

    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }

    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }

    @IBAction func calculateBMI(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heightSlider.value

       // let bmi = weight / (height * height)
       // bmiValue = String(format: "%.1f", bmi)
        calculatorBrain.calculateBMI(height: height, weight: weight)


        self.performSegue(withIdentifier: "goToResult", sender: self)


        

//        let secondVC = SecondViewController()
//        secondVC.mbiCalculated = String(format: "%.1f", bmi)
//
//        present(secondVC, animated: true)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultViewController = segue.destination as! ResultViewController  //downcasting
            resultViewController.bmiValue = calculatorBrain.getBMIValue()
        }
    }

}

