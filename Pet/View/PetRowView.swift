//
//  PetRowView.swift
//  Pet
//
//  Created by Gerard Gomez on 1/19/25.
//

import SwiftUI

struct PetRowView: View {
    let pet: Pet
    var body: some View {
        HStack {
            profileImage
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    Text(pet.name)
                    if pet.hasAward {
                        Image(systemName: "trophy.fill")
                            .foregroundStyle(.green)
                    }
                    if pet.isNocturnal {
                        Image(systemName: "moon.fill")
                            .foregroundStyle(.gray)
                    }
                }
                Text(pet.trick)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
            
    }
    private var profileImage: some View {
        pet.profileImage
            .padding()
            .clipShape(.circle)
            .shadow(radius: 3)
            .overlay {
                Circle()
                    .stroke(.green, lineWidth: 2)
            }
    }
}

#Preview {
    PetRowView(pet: .samplePet)
}
