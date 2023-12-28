//
//  CustomHeaderView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 11/08/23.
//

import SwiftUI

struct CustomHeaderView: View {
    @Environment(\.dismiss) var dismiss
    @State var isAnimating: Bool = false
    var titleName: String
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .imageScale(.large)
            })
            .padding(.leading, 15)
            Spacer()
            Text(titleName)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(.trailing, 20)
                .shadow(color: Color.gray.opacity(0.5),radius: 2, x: 2, y: 1)
                .offset(y: isAnimating ? 0 : -10)
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeOut(duration: 0.7), value: isAnimating)
            Spacer()
        }
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct CustomHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomHeaderView(titleName: "Neurosurgeon")
    }
}
