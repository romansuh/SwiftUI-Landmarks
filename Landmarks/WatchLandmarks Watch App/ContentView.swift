//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Roman Sukhodoslkiy on 01.03.2025.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        LandmarkList().task {
            let center = UNUserNotificationCenter.current()
            _ = try? await center.requestAuthorization(
                options: [.alert, .sound, .badge]
            )
        }
    }
}

#Preview {
    ContentView().environment(ModelData())
}
