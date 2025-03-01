//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by Roman Sukhodoslkiy on 01.03.2025.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?

    var body: some View {
        ScrollView {
            VStack {
                if let landmark {
                    LandmakImage(image: landmark.image.resizable())
                        .scaledToFit()
                }
                
                Text(title ?? "Unknown Landmark")
                    .font(.headline)
                
                Divider()
                
                Text(
                    message
                    ?? "You are within 5 miles of one of your favorite landmarks."
                )
                .font(.caption)
            }
        }
    }
}

#Preview {
    NotificationView()
}

#Preview {
    NotificationView(
        title: "Turtle Rock",
        message: "You are within 5 miles of Turtle Rock.",
        landmark: ModelData().landmarks[0])
}
