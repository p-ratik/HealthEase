//
//  SignUpView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        ZStack {
            Color(red: 235/255, green: 240/255, blue: 249/255)
            VStack {
                LoginTitleView(title: "Sign Up")
                SignInQuestionView(question: "Already have an account?", buttonText: "Sign In!")
                SignUpTextboxButtonView()
                
                
            }
            .padding(.top, 70)
        } //: ZSTACK
        .edgesIgnoringSafeArea(.all)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
