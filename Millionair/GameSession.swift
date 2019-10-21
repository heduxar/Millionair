//
//  GameSession.swift
//  Millionair
//
//  Created by Юрий Султанов on 21.10.2019.
//  Copyright © 2019 Юрий Султанов. All rights reserved.
//

import Foundation

class GameSession {
    let date: Date
    let score: Int
    let totalQuestions: Int
    
    init(date: Date, score: Int, totalQuestions: Int) {
        self.date = date
        self.score = score
        self.totalQuestions = totalQuestions
    }
}
