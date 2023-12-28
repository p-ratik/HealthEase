//
//  HomeTopView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 04/08/23.
//

import SwiftUI

struct HomeTopView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Find Your")
                    .font(.system(size: 23))
                Text("Specialist")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
            }
            .padding()
            Spacer()
            HStack {
                TextField("Search", text: $searchText)
                    .padding(.horizontal)
                    .autocorrectionDisabled(true)
                Button(action: {
                    searchText = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                        .imageScale(.medium)
                        .padding(.trailing)
                        .padding(.vertical, 10)
                })
            }
            .background(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black.opacity(0.5))
            )
            .padding(.trailing)
        }
    }
}

struct HomeTopView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopView(searchText: .constant(""))
    }
}
