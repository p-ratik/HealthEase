//
//  LoginTextBoxView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI

struct LoginTextBoxButtonView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var coreDataViewModel: CoreDataViewModel
    @State private var emailError: Bool = false
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                HStack {
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                        .onTapGesture {
                            emailError = false
                        }
                } //: HSTACK
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(email != "" ? (emailError ? Color.red : Color.blue) : Color.gray.opacity(0.8), lineWidth: email != "" ? 2 : 1)
                )
                if emailError {
                    Text("Please Enter valid Email")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            } //: VSTACK
            HStack {
                SecureField("Password", text: $password)
            } //: HSTACK
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(password != "" ? Color.blue : Color.gray.opacity(0.8), lineWidth: password != "" ? 2 : 1)
            )
            
//            Button(action: {
//            }, label: {
//                HStack {
//                    Text("Forgot your Password?")
//                    Spacer()
//                }
//            })
            
            Button(action: {
                if(!authViewModel.emailValidation(email)) {
                    emailError = true
                }
                else {
                    emailError = false
                    if(self.coreDataViewModel.fetchUser(email: email) == nil) {
                        self.coreDataViewModel.addUser(email: email, password: password)
                    }
                    authViewModel.loginUser(email: email, password: password)
                }
            }, label: {
                HStack {
                    Spacer()
                    Text("Sign In")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Image(systemName: "arrow.forward.circle")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                }
                .frame(height: 18)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 3).fill(Color(red: 46/255, green: 106/255, blue: 217/255))
                )
            })
            .opacity(email == "" || password == "" ? 0.7 : 1)
            .disabled(email == "" || password == "")
            .alert(authViewModel.errorMssg, isPresented: $authViewModel.isErrorPresented) {
                Button("OK", role: .cancel) { }
            }
        } //: VSTACK
        .padding(.horizontal)
        .padding(.bottom, 30)
        .onAppear(perform: {
            email = ""
            password = ""
            emailError = false
        })
        
        
    }
}

struct LoginTextBoxView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextBoxButtonView()
            .environmentObject(AuthViewModel())
            .environmentObject(CoreDataViewModel())
    }
}
