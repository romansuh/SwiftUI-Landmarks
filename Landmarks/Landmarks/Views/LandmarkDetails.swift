//
//  LandmarkDetails.swift
//  Landmarks
//
//  Created by Roman Sukhodoslkiy on 16.02.2025.
//

import SwiftUI

struct LandmarkDetails: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var landmark: Landmark

    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 500)

            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(landmark.name)
                            .font(.title2)
                            .foregroundColor(.brown)
                        Text(landmark.park).font(.subheadline).foregroundColor(
                            .gray)
                        Text(landmark.state).font(.subheadline).foregroundColor(
                            .gray)
                    }
                    .frame(
                        maxWidth: UIScreen.screenWidth / 1.7,
                        alignment: .leading)

                    Spacer()

                    LandmakImage(image: landmark.image)
                        .offset(y: -130)
                        .padding(.bottom, -200)
                }

                Divider()

                Text("About \(landmark.name)")
                    .font(.title3)
                
                if sizeClass == .regular {
                    HStack(alignment: .top, spacing: 20) {
                        let words = landmark.description.split(separator: " ")
                        let midIndex = words.count / 2

                        VStack(alignment: .leading) {
                            Text(words.prefix(midIndex).joined(separator: " "))
                                .font(.body)
                        }

                        VStack(alignment: .leading) {
                            Text(words.suffix(from: midIndex).joined(separator: " "))
                                .font(.body)
                        }
                    }
                } else {
                    Text(landmark.description)
                        
                }
            }
            .frame(width: .infinity)
            .padding(.horizontal)
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    LandmarkDetails(landmark: landmarks[0])
}
