//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var billTextfield: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    var percentSelected: Character = "1"
    var total: Double = 0
    var splitWith: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tipChanged(_ sender: UIButton) {
        billTextfield.endEditing(true)

        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false

        sender.isSelected = true

        if let percent = sender.currentTitle?.first {
            percentSelected = percent
        }


    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))


    }


    @IBAction func calculateTapped(_ sender: UIButton) {
        guard let input = billTextfield.text else { return }
        if input == "" {
            return
        }
        guard let splitBy = splitNumberLabel.text else { return }

        var totalAmount: Double =  Double(input) ?? 0.0
        print("input: \(input)")
        print("split by: \(splitBy)")

                   if percentSelected == "0" {
                       totalAmount = totalAmount / Double(splitBy)!
                    print("when 0: \(totalAmount)")
                   }else if percentSelected == "1" {
                    totalAmount = (totalAmount + (totalAmount * 0.10)) / Double(splitBy)!
                    print("when 10: \(totalAmount)")
                   }else {
                       totalAmount = (totalAmount + (totalAmount * 0.20)) / Double(splitBy)!
                    print("when 20: \(totalAmount)")
                   }

        total = totalAmount
        splitWith = splitBy


        self.performSegue(withIdentifier: "calculateTip", sender: self)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateTip" {
            let resultViewController = segue.destination as! ResultViewController

            resultViewController.total = total
            resultViewController.perCentage = percentSelected
            resultViewController.splitBy = splitWith



        }
    }

}

