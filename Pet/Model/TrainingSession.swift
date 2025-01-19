//
//  TrainingSession.swift
//  Pet
//
//  Created by Gerard Gomez on 1/19/25.
//

import Foundation
import SwiftData

@Model
final class TrainingSession {
    var date = Date.now
    var trainer = ""
    var score = 0
    var duration: TimeInterval = 0.0
    var notes: String? = nil
    var pet: Pet?
    
    init(date: Date, trainer: String = "", score: Int = 0, duration: TimeInterval, notes: String? = nil, pet: Pet? = nil) {
        self.date = date
        self.trainer = trainer
        self.score = score
        self.duration = duration
        self.notes = notes
        self.pet = pet
    }
}
