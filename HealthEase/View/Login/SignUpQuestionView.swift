//
//  SignQuestionView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI

struct SignQuestionView: View {
    var question: String
    var buttonText: String
    
    var body: some View {
        
        HStack {
            Text(question)
                .foregroundColor(.black.opacity(0.7))
                .font(.subheadline)
            
            NavigationLink(destination:
                SignUpView()
                .navigationBarBackButtonHidden(true)
                           
                , label: {
                Text(buttonText)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .bold()
            })
            Spacer()
        }
        .padding(.leading)
        .padding(.bottom, 30)
    }
}

struct SignQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        SignQuestionView(question: "Don't have an account?", buttonText: "Sign up!")
    }
}
