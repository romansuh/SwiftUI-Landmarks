//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Roman Sukhodoslkiy on 01.03.2025.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark

    var body: some View {
        landmark.featureImage?
            .resizable().overlay(
                TextOverlay(name: landmark.name, location: landmark.park)
            )
    }
}

struct TextOverlay: View {
    var name: String
    var location: String

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                    .bold()
                Text(location)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    FeatureCard(landmark: ModelData().features[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}
