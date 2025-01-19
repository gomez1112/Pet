//
//  PreviewData.swift
//  Pet
//
//  Created by Gerard Gomez on 1/19/25.
//

import SwiftData
import SwiftUI

struct PreviewData: PreviewModifier {
    static func makeSharedContext() async throws -> ModelContainer {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Pet.self, TrainingSession.self, configurations: configuration)
        let pets = Pet.samplePets
        
        pets.forEach { container.mainContext.insert($0)}
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content
            .modelContainer(context)
    }
}
