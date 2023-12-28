//
//  RatingView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 11/08/23.
//

import SwiftUI

struct RatingView: View {
    var rating: String
    var body: some View {
        HStack(spacing: 0){
            ForEach(1...Int(rating)!, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .renderingMode(.template)
                    .foregroundColor(.yellow)
            }
            
            ForEach(Int(rating)!..<5, id: \.self) { _ in
                Image(systemName: "star")
                    .renderingMode(.template)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: "3")
    }
}
