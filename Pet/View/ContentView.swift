//
//  ContentView.swift
//  Pet
//
//  Created by Gerard Gomez on 1/19/25.
//

import SwiftData
import SwiftUI

enum SearchScope: String, Identifiable, CaseIterable {
    case allPets
    case myPets
    case otherPets
    
    var title: String {
        switch self {
            case .allPets: "All Pets"
            case .myPets: "My Pets"
            case .otherPets: "Other Pets"
        }
    }
    
    var id: Self { self }
}
struct PetSearchToken: Identifiable, Hashable {
    var id = UUID()
    var kind: Pet.Kind
}
struct ContentView: View {
    @State private var searchTokens: [PetSearchToken] = []
    @State private var searchScope: SearchScope = .allPets
    @Query(sort: \Pet.name) private var pets: [Pet]
    @Environment(\.modelContext) private var context
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            Button("Add pet") {
                let pet = Pet("New Pet", kind: .cat)
                context.insert(pet)
            }
            List {
                if searchScope == .allPets || searchScope == .myPets {
                    // Section for My Pets
                    if !filteredMyPets.isEmpty {
                        Section("My Pets") {
                            ForEach(filteredMyPets) { pet in
                                row(pet: pet)
                            }
                        }
                    }
                }
                if searchScope == .allPets || searchScope == .otherPets {
                    
                    
                    // Section for Other Pets
                    if !filteredOtherPets.isEmpty {
                        Section("Other Pets") {
                            ForEach(filteredOtherPets) { pet in
                                row(pet: pet)
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText, editableTokens: $searchTokens, prompt: Text("Search pets")) { $token in
                Label(token.kind.rawValue.capitalized, systemImage: token.kind.systemImage)
            }
            .searchScopes($searchScope) {
                ForEach(SearchScope.allCases) { scope in
                    Text(scope.title)
                        .tag(scope)
                }
            }
            .searchSuggestions {
                // Show pet name suggestions first
                if !searchText.isEmpty {
                    ForEach(pets.filter { $0.name.localizedCaseInsensitiveContains(searchText) }) { pet in
                        Button {
                            searchText = pet.name
                        } label: {
                            Text("Did you mean: \(pet.name)?")
                        }
                    }
                }
                
                // Followed by kind-based token suggestions
                ForEach(Pet.Kind.allCases, id: \.self) { kind in
                    Button {
                        let newToken = PetSearchToken(kind: kind)
                        if !searchTokens.contains(newToken) {
                            searchTokens.append(newToken)
                        }
                    } label: {
                        Label(kind.rawValue.capitalized, systemImage: kind.systemImage)
                    }
                }
            }
            .navigationTitle("Pets")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Reset") {
                        resetScope()
                    }
                }
            }
        }
    }
    private func resetScope() {
        searchScope = .allPets
        searchText = ""
        searchTokens.removeAll()
    }
    private var searchSuggestions: some View {
        ForEach(pets) { pet in
            Text("Maybe you meant: \(pet.name)?")
                .searchCompletion(pet.name)
        }
    }
    
    private func row(pet: Pet) -> some View {
        PetRowView(pet: pet)
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                Button("Award", systemImage: "trophy", action: pet.giveAward)
                    .tint(.orange)
                Button("Nocturnal Mode", systemImage: "moon", action: pet.makeNocturnal)
                    .tint(.gray)
                ShareLink(item: pet, preview: SharePreview("Pet", image: pet.profileImage))
                    .tint(.blue)
            }
    }
    
    private var filteredMyPets: [Pet] {
        pets.prefix(2).filter { passesSearchCriteria($0) }
    }
    private var filteredOtherPets: [Pet] {
        pets.dropFirst(2).filter { passesSearchCriteria($0) }
    }
    private func passesSearchCriteria(_ pet: Pet) -> Bool {
        let textMatch = searchText.isEmpty || pet.name.localizedCaseInsensitiveContains(searchText)
        let tokenMatch = searchTokens.isEmpty || searchTokens.contains { $0.kind == pet.kind }
        let scopeMatch: Bool
        
        switch searchScope {
            case .allPets:
                scopeMatch = true
            case .myPets:
                scopeMatch = pets.prefix(2).contains(where: { $0.id == pet.id })
            case .otherPets:
                scopeMatch = pets.dropFirst(2).contains(where: { $0.id == pet.id })
        }
        
        return textMatch && tokenMatch && scopeMatch
    }
}

#Preview(traits: .previewData) {
    ContentView()
}
