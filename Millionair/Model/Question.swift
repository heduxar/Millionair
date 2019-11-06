//
//  Question.swift
//  Millionair
//
//  Created by Юрий Султанов on 20.10.2019.
//  Copyright © 2019 Юрий Султанов. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let correctAnswer: String
    let answers: [String]
    
    init(question: String, correctAnswer: String, answers: [String]) {
        self.question = question
        self.correctAnswer = correctAnswer
        self.answers = answers
    }
}
