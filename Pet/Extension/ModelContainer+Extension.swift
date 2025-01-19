//
//  ModelContainer+Extension.swift
//  Pet
//
//  Created by Gerard Gomez on 1/19/25.
//

import SwiftData

extension ModelContainer {
    static let createContainer: ModelContainer = {
        let schema = Schema([Pet.self, TrainingSession.self])
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: configuration)
        } catch {
            fatalError("Could not create model container: \(error.localizedDescription).")
        }
    }()
}
