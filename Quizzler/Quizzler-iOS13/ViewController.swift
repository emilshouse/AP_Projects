//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    @IBOutlet var progressBar: UIProgressView!

    var question = 0

    // MARK:- Questions
    var questionBank = [
        ["TWO + FOUR = SIX.", "True"],
        ["Bill Clinton was president of Ukraine.", "False"],
        ["Banku and Okro is a favorite of the Swahila people.", "False"]
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerTapped(_ sender: UIButton) {

        let submittedAnswer = sender.currentTitle
        let correctAnswer = questionBank[question][1]

        if question < questionBank.count - 1 {
        question += 1
        } else {
            question = 0
        }

        if submittedAnswer == correctAnswer {
            print("correct")
        } else {
            print("wrong")
        }

        updateUI()

    }

    func updateUI() {
        questionLabel.text = questionBank[question][0]

    }



}

