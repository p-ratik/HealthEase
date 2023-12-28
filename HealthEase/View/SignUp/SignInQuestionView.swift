//
//  SignInQuestionBoxView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI

struct SignInQuestionView: View {
    var question: String
    var buttonText: String
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Text(question)
                .foregroundColor(.black.opacity(0.7))
                .font(.subheadline)
            Button(action: {
                dismiss()
            }, label: {
                Text(buttonText)
                    .foregroundColor(.blue)
                    .font(.subheadline)
                    .bold()
            })
            Spacer()
        }
        .padding(.leading)
        .padding(.bottom, 30)
    }
}

struct SignInQuestionBoxView_Previews: PreviewProvider {
    static var previews: some View {
        SignInQuestionView(question: "Already have an account?", buttonText: "Sign In!")
    }
}
