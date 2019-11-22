//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Adnan Abdulai on 11/20/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let questionBank = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], c: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], c: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], c: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], c: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], c: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], c: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], c: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], c: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], c: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], c: "Australia")

    ]

    var questionNumber = 0
    var score = 0

    mutating func checkAnswer(_ userAnwser: String) -> Bool {
        if userAnwser == questionBank[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }

    func getQuestionText() -> String {
        return questionBank[questionNumber].question
    }

    func getPossibleAnswers() -> [String] {
        return questionBank[questionNumber].possibleAnswers
    }

    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(questionBank.count)
    }

    mutating func nextQuestion() {
        if questionNumber < questionBank.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }

    func getScore() -> String {
        return String("Score: \(score)")
    }

    
}
