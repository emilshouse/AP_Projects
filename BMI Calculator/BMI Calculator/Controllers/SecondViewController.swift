//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Adnan Abdulai on 12/10/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var mbiCalculated = "0.0"

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

        let label = UILabel()
        label.text = "Hello"
        label.frame = CGRect(x: 10, y: 10, width: 100, height: 50)
        view.addSubview(label)

    }



    
}
