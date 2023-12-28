//
//  CustomTabBarItem.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI

struct CustomTabBarItem: View {
    
    var tab: String
    @Binding var selected: String
    
    var body: some View {
            ZStack {
                Button(action: {
                    withAnimation(.default) {
                        selected = tab
                    }
                    
                }, label: {
                    HStack {
                        Image(tab)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(selected == tab ? .white : .black)
                        if(selected == tab) {
                            Text(tab)
                                .foregroundColor(selected == tab ? .white : .black)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                        }
                        
                        
                    }
            })
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(selected == tab ? Color(red: 40/255, green: 85/255, blue: 191/255) : .white)
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
        
    }
}
