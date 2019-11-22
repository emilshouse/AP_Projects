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
    @IBOutlet var answer1Button: UIButton!
    @IBOutlet var answer2Button: UIButton!
    @IBOutlet var answer3Button: UIButton!
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

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

        quizBrain.nextQuestion()

    }

    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        answer1Button.setTitle(quizBrain.getPossibleAnswers()[0], for: .normal)
        answer2Button.setTitle(quizBrain.getPossibleAnswers()[1], for: .normal)
        answer3Button.setTitle(quizBrain.getPossibleAnswers()[2], for: .normal)

        answer1Button.backgroundColor = .clear
        answer2Button.backgroundColor = .clear
        answer3Button.backgroundColor = .clear
        

        progressBar.progress = quizBrain.getProgress()
        score.text = quizBrain.getScore()
    }

}

