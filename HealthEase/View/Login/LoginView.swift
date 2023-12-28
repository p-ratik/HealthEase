//
//  LoginView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 235/255, green: 240/255, blue: 249/255)
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70, alignment: .center)
                    LoginTitleView(title: "Sign In")
                    SignQuestionView(question: "Don't have an account?", buttonText: "Sign up!")
                    LoginTextBoxButtonView()
                    Spacer()
                }
                .padding(.top, 80)
            }
            .edgesIgnoringSafeArea(.all)
            
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
