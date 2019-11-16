//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let softTime = 5
    let mediumTime = 7
    let hardTime = 12

    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]


    @IBAction func hardnessSelected(_ sender: UIButton) {
        var interval = eggTimes[sender.currentTitle!]!
//        switch sender.currentTitle {
//        case "Soft":
//            print(eggTimes["Soft"]!)
//        case "Medium":
//            print(eggTimes["Medium"]!)
//        case "Hard":
//            print(eggTimes["Hard"]!)
//        default:
//            print("Hardness out of bounds")
//        }

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if interval > 0 {
                print("\(interval) seconds")
                interval -= 1
            }

        }
    }





}
