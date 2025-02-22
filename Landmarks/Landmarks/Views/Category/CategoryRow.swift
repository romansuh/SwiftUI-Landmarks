//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Roman Sukhodoslkiy on 22.02.2025.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var landmarks: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 7)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(landmarks) { landmark in
                        NavigationLink {
                            LandmarkDetails(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }.frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        landmarks: Array(landmarks.prefix(3))
    )
}
