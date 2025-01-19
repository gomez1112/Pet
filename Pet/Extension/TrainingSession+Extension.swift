//
//  TrainingSession+Extension.swift
//  Pet
//
//  Created by Gerard Gomez on 1/19/25.
//

import Foundation

extension TrainingSession {
    @MainActor
    static let sampleSessions: [TrainingSession] = [
        TrainingSession(date: .now, trainer: "Gerard", score: 4, duration: 30, notes: "Great Job!"),
        TrainingSession(date: .now - 1.0, trainer: "Gerard", score: 3, duration: 20, notes: "Need to work on consistency."),
        TrainingSession(date: .now - 2.0, trainer: "Stefan", score: 5, duration: 40, notes: "Excellent work!"),
        TrainingSession(date: .now - 3.0, trainer: "Aiden", score: 2, duration: 10, notes: "Need to improve focus."),
    ]
    @MainActor
    static let sampleSession = sampleSessions.first!
}
