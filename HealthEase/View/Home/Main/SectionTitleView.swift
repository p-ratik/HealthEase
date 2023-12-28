//
//  SectionTitleView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 07/08/23.
//

import SwiftUI

struct SectionTitleView: View {
    var text: String
    var body: some View {
        HStack {
            Text(text)
                .font(.title2)
                .foregroundColor(Color.black.opacity(0.8))
                .fontWeight(.bold)
            Spacer()
        }
    }
}

struct SectionTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitleView(text: "Categories")
            
    }
}
