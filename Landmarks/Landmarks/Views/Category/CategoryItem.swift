//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Roman Sukhodoslkiy on 22.02.2025.
//

import SwiftUI


struct CategoryItem: View {
    var landmark: Landmark
    
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .font(.caption)
                .foregroundStyle(.black)
        }
        .padding(.leading, 7).padding(.trailing, 7)
    }
}


#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
