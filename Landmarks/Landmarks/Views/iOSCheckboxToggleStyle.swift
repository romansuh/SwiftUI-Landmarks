//
//  iOSCheckboxToggleStyle.swift
//  Landmarks
//
//  Created by Roman Sukhodoslkiy on 16.02.2025.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(
            action: {
                configuration.isOn.toggle()

            },
            label: {
                HStack {
                    Image(
                        systemName: configuration.isOn
                        ? "checkmark.square.fill" : "square").foregroundColor(configuration.isOn ? .red : .black)

                    configuration.label
                }
            })
    }
}
