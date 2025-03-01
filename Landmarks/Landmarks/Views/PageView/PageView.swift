//
//  PageView.swift
//  Landmarks
//
//  Created by Roman Sukhodoslkiy on 01.03.2025.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]

    @State private var currentPage = 0

    func scrollPage(next: Bool) {
        if next {
            currentPage = (currentPage + 1) % pages.count
        } else {
            currentPage = (currentPage - 1 + pages.count) % pages.count
        }
    }

    var body: some View {
        ZStack {
            ZStack(alignment: .bottomTrailing) {
                PageViewController(pages: pages, currentPage: $currentPage)
                    .aspectRatio(3 / 2, contentMode: .fit)

                PageControl(
                    numberOfPages: pages.count, currentPage: $currentPage
                )
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
            }

            HStack {
                Button {
                    scrollPage(next: false)
                } label: {
                    Label("Prev image", systemImage: "arrow.left")
                        .labelStyle(.iconOnly).foregroundStyle(.black).frame(
                            width: 30, height: 30
                        ).background(in: .circle).padding(.leading).opacity(0.5)
                        .shadow(radius: 20)
                }

                Spacer()

                Button {
                    scrollPage(next: true)
                } label: {
                    Label("Next image", systemImage: "arrow.right")
                        .labelStyle(.iconOnly).foregroundStyle(.black)
                        .frame(
                            width: 30, height: 30
                        ).background(in: .circle).padding(.trailing)
                        .opacity(
                            0.5
                        ).shadow(radius: 20)
                }
            }
        }
    }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
