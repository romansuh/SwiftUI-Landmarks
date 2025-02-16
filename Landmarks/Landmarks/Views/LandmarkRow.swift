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
        }.padding()
    }
}

#Preview {
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

#Preview("Silver Salmon Creek") {
    LandmarkRow(landmark: landmarks[1])
}
