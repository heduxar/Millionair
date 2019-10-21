//
//  GameSession.swift
//  Millionair
//
//  Created by Юрий Султанов on 21.10.2019.
//  Copyright © 2019 Юрий Султанов. All rights reserved.
//

import Foundation

class GameSession: Codable {
    var date: Date
    var score: Int
    var percent: Int
    
    init (date: Date, score: Int, percent: Int) {
        self.date = date
        self.score = score
        self.percent = percent
    }
}
