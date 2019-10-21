//
//  Game.swift
//  Millionair
//
//  Created by Юрий Султанов on 21.10.2019.
//  Copyright © 2019 Юрий Султанов. All rights reserved.
//

import Foundation

class Game {
    
    static let shared = Game()
    
    private(set) var records: [GameSession] {
        didSet {
            recordsProvider.save(records: self.records)
        }
    }
    
    private let recordsProvider = RecordProvider()
    
    private init() {
        self.records = self.recordsProvider.retrieveRecords()
    }
    
    func addRecord(_ record: GameSession) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
}
