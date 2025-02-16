//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Roman Sukhodoslkiy on 16.02.2025.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(
                    .rect(cornerRadius: 10)
                )

            Text(landmark.name)

            Spacer()

            if landmark.isFavorite {
                Image(systemName: "mappin.circle.fill")
                    .foregroundStyle(.red)
                    .font(.title)
            }
        }.padding()
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
