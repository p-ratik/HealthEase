//
//  CategoryItemView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 07/08/23.
//

import SwiftUI
import Kingfisher

struct CategoryItemView: View {
    var category: Category
    var width: CGFloat, height: CGFloat
    var body: some View {
        VStack {
            KFImage(URL(string: category.image))
                .resizable()
                .placeholder({
                    LoadingView(color: Color.blue)
                        .scaleEffect(0.5)
                })
                .scaledToFit()
                
            Text(category.categoryName)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(Color.black.opacity(0.5))
        }
        .frame(width: width, height: height, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}
