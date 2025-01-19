//
//  Pet.swift
//  Pet
//
//  Created by Gerard Gomez on 1/19/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Pet {
    var name = ""
    var kind = Kind.cat
    var trick = ""
    @Attribute(.externalStorage) var profileImageData: Data?
    @Attribute(.transformable(by: ColorTransformer.self)) var favoriteColor = UIColor.green
    var systemImageName: String?
    var hasAward = false
    var isNocturnal = false
    @Relationship(deleteRule: .cascade, inverse: \TrainingSession.pet) var sessions: [TrainingSession]? = []
    enum Kind: String, Identifiable, CaseIterable, Codable {
        case cat, dog, fish, bird, lizard, turtle, rabbit, bug
        var systemImage: String {
            switch self {
                case .cat: "cat.fill"
                case .dog: "dog.fill"
                case .fish: "fish.fill"
                case .bird: "bird.fill"
                case .lizard: "lizard.fill"
                case .turtle: "tortoise.fill"
                case .rabbit: "hare.fill"
                case .bug: "ladybug.fill"
            }
        }
        
        var id: Self { self }
    }
    
    init(_ name: String = "", kind: Pet.Kind = Kind.cat, trick: String = "", profileImageData: Data? = nil, favoriteColor: Color = .green, systemImageName: String? = nil, hasAward: Bool = false, isNocturnal: Bool = false, sessions: [TrainingSession]? = []) {
        self.name = name
        self.kind = kind
        self.trick = trick
        self.profileImageData = profileImageData
        //  self.favoriteColor = UIColor(favoriteColor)
        self.systemImageName = systemImageName
        self.hasAward = hasAward
        self.isNocturnal = isNocturnal
        self.sessions = sessions
    }
    
    var profileImage: Image {
        if let data = profileImageData,
           let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        } else if let symbol = systemImageName {
            return Image(systemName: symbol)
        } else {
            return Image(systemName: "questionmark.circle.fill")
        }
    }
    func giveAward() {
        hasAward = true
    }
    func makeNocturnal() {
        isNocturnal.toggle()
    }
}
