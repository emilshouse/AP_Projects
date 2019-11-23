//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Adnan Abdulai on 11/20/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
struct Question {
    let question: String
    let possibleAnswers: [String]
    let correctAnswer: String

    init(q: String, a: [String], c: String) {
        question = q
        possibleAnswers = a
        correctAnswer = c
    }
}
