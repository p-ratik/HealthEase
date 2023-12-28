//
//  FilteredDataGridView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 14/08/23.
//

import SwiftUI

struct FilteredDataGridView: View {
    var category: [Category]
    var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    var body: some View {
        VStack {
            SectionTitleView(text: "Categories")
                .padding()
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 5) {
                ForEach(category) { category in
                    NavigationLink(destination: {
                        CategoryListView(categoryName: category.categoryName)
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        CategoryItemView(category: category, width: 82, height: 82)
                    })
                }
            }
            .padding(.horizontal, 15)
        }
        
    }
}

struct FilteredDataGridView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredDataGridView(category: [Category(id: "2", categoryName: "demo", image: "demo")])
    }
}
