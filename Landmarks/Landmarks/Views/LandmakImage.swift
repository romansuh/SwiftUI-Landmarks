//
//  CircleImage.swift
//  Landmarks
//
//  Created by Roman Sukhodoslkiy on 16.02.2025.
//

import SwiftUI

struct LandmakImage: View {
    var image: Image

    var body: some View {
        image
            .frame(width: 150, height: 150)
            .clipShape(.rect(cornerRadius: 25))
            .shadow(radius: 7)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 3)
            }
    }
}

#Preview {
    LandmakImage(image: Image("turtlerock"))
}
