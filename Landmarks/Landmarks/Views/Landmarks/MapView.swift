//
//  MapView.swift
//  Landmarks
//
//  Created by Roman Sukhodoslkiy on 16.02.2025.
//

import MapKit
import SwiftUI

struct MapView: View {
    var coordinate: CLLocationCoordinate2D

    var body: some View {
        Map(position: .constant(.region(region))) {
            Marker("Landmark", coordinate: coordinate)
        }.modifier(DisableInteractionIfWatchOS())
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
        )
    }
}

// Custom view modifier to disable interaction only on watchOS
struct DisableInteractionIfWatchOS: ViewModifier {
    func body(content: Content) -> some View {
        #if os(watchOS)
            content.allowsHitTesting(false)  // Disables scroll & interaction on watchOS
        #else
            content  // Keep normal behavior on other platforms
        #endif
    }
}

#Preview {
    MapView(
        coordinate: CLLocationCoordinate2D(
            latitude: 34.011_286, longitude: -116.166_868))
}
