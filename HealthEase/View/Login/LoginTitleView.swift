//
//  LoginTitleView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI

struct LoginTitleView: View {
    var title: String
    var body: some View {
        HStack() {
            Text(title)
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.black.opacity(0.8))
                .padding(.leading)
                .padding(.vertical, 10)
            Spacer()
        }
    }
}

struct LoginTitleView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTitleView(title: "Sign In")
    }
}
