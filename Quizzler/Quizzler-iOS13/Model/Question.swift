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
    let answer: String

    init(q: String, a: String) {
        question = q
        answer = a
    }
}
