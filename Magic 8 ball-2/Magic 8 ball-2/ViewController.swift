//
//  ViewController.swift
//  Magic 8 ball-2
//
//  Created by Adnan Abdulai on 11/3/19.
//  Copyright © 2019 Adnan Abdulai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let answers = [#imageLiteral(resourceName: "ball1"),#imageLiteral(resourceName: "ball2"),#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball4"),#imageLiteral(resourceName: "ball5")]

    @IBOutlet var eightBallImageView: UIImageView!


    @IBAction func askButtonPressed(_ sender: UIButton) {
        eightBallImageView.image = answers.randomElement()
      //  eightBallImageView.image = answers[Int.random(in: 0...4)]
    }

}

