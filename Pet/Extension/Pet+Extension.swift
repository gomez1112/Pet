//
//  Pet+Extension.swift
//  Pet
//
//  Created by Gerard Gomez on 1/19/25.
//

import CoreTransferable
import Foundation

extension Pet {
    @MainActor
    static let samplePets: [Pet] = [
        Pet("Roofus", kind: .dog, trick: "Home runs", favoriteColor: .blue, systemImageName: "dog.fill", sessions: TrainingSession.sampleSessions),
        Pet("Sheldon", kind: .turtle, trick: "Kickflip", favoriteColor: .brown, systemImageName: "tortoise.fill"),
        Pet("Whiskers", kind: .cat, trick: "Tightrope walking", favoriteColor: .green, systemImageName: "cat.fill"),
        Pet("Bubbles", kind: .fish, trick: "100m freestyle", favoriteColor: .orange, systemImageName: "fish.fill"),
        Pet("Mango", kind: .bird,  trick: "Basketball dunk", favoriteColor: .green, systemImageName: "bird.fill"),
        Pet("Ziggy", kind: .lizard, trick: "Parkour", favoriteColor: .purple, systemImageName: "lizard.fill"),
        Pet("Chirpy", kind: .bug, trick: "Canon in D", favoriteColor: .orange, systemImageName: "ladybug.fill"),
        Pet("Tersi", kind: .dog, trick: "rollover", favoriteColor: .brown, systemImageName: "dog.fill", sessions: TrainingSession.sampleSessions),
    ]
    
    @MainActor
    static let samplePet = samplePets.first!
}
extension Pet: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation { $0.name }
    }
}
