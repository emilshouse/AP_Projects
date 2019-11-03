//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var diceImageView1: UIImageView!
    @IBOutlet var diceImageView2: UIImageView!

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceOptions = ["One","Two", "Three", "Four", "Five", "Six"]

        diceImageView1.image = UIImage(named: "Dice\(diceOptions.randomElement()!)")
        diceImageView2.image = UIImage(named: "Dice\(diceOptions.randomElement()!)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        diceImageView1.image = UIImage(named:"DiceOne")
        //Using Image literal
        diceImageView2.image = #imageLiteral(resourceName: "DiceThree")
    }


}

