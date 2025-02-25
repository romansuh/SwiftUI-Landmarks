//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Roman Sukhodoslkiy on 25.02.2025.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile

    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(
            byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(
            byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }

    var body: some View {
        List {
            HStack {
                Text("Username").foregroundStyle(.secondary)
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.trailing).foregroundStyle(.blue)
            }

            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").foregroundStyle(.secondary)
            }

            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }.foregroundStyle(.secondary)

            DatePicker(
                selection: $profile.goalDate, in: dateRange,
                displayedComponents: .date
            ) {
                Text("Goal Date").foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
