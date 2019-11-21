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
    @IBOutlet var score: UILabel!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerTapped(_ sender: UIButton) {

        let userAnswer = sender.currentTitle!
        let userGotitright = quizBrain.checkAnswer(userAnswer)


//        if userGotitright {
//            sender.backgroundColor = .green
//        } else {
//            sender.backgroundColor = .red
//        }
        sender.backgroundColor = userGotitright ? .green : .red

        quizBrain.nextQuestion()

            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }

    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        progressBar.progress = quizBrain.getProgress()
        score.text = quizBrain.getScore()
    }

}

