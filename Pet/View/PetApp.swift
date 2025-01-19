//
//  PetApp.swift
//  Pet
//
//  Created by Gerard Gomez on 1/19/25.
//

import SwiftData
import SwiftUI

@main
struct PetApp: App {
    init() {
        ColorTransformer.register()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(ModelContainer.createContainer)
        }
    }
}
