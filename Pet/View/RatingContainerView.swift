//
//  RatingContainerView.swift
//  Pet
//
//  Created by Gerard Gomez on 1/19/25.
//

import SwiftUI

struct RatingContainerView: View {
    @State private var rating = 5
    var body: some View {
        Gauge(value: Double(rating), in: 0...10) {
            Text("Rating")
        }
        RatingView(rating: $rating)
    }
}

#Preview {
    RatingContainerView()
}
