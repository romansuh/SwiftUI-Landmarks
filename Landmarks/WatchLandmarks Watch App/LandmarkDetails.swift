//
//  LandmarkDetails.swift
//  WatchLandmarks Watch App
//
//  Created by Roman Sukhodoslkiy on 01.03.2025.
//

import SwiftUI

struct LandmarkDetails: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        @Bindable var modelData = modelData

        ScrollView {
            VStack {
                LandmakImage(image: landmark.image.resizable())
                    .scaledToFit()

                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text(landmark.name).font(.headline).lineLimit(0)
                        FavoriteButton(
                            isSet: $modelData.landmarks[landmarkIndex]
                                .isFavorite
                        ).font(.title2).scaledToFill()
                    }

                    Divider().padding(.vertical, 5)

                    Text(landmark.park)
                        .font(.caption)
                        .bold()
                        .lineLimit(0)

                    Text(landmark.state)
                        .font(.caption)

                    Divider()

                    MapView(coordinate: landmark.locationCoordinate)
                        .scaledToFit().cornerRadius(10).padding(3)
                }.padding(.horizontal, 2)
            }
        }.navigationTitle("Landmarks")
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetails(landmark: modelData.landmarks[0])
        .environment(modelData)
}
