//
//  RatingView.swift
//  Pet
//
//  Created by Gerard Gomez on 1/19/25.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    var body: some View {
        HStack {
            Button("Decrease", systemImage: "minus.circle") {
                withAnimation {
                    rating -= 1
                }
            }
            .disabled(rating == 0)
            .labelStyle(.iconOnly)
            Text(rating, format: .number.precision(.integerLength(2)))
                .monospaced()
                .contentTransition(.numericText(value: Double(rating)))
                .font(.title.bold())
            Button("Decrease", systemImage: "plus.circle") {
                withAnimation {
                    rating += 1
                }
            }
            .disabled(rating == 10)
            .labelStyle(.iconOnly)
        }
    }
}

#Preview {
    @Previewable @State var rating: Int = 0
    RatingView(rating: $rating)
}
