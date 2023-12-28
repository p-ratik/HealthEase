//
//  SignUpTextboxView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI
import FirebaseAuth

struct SignUpTextboxButtonView: View {
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject var coreDataViewModel: CoreDataViewModel
    @State private var signUpEmail = ""
    @State private var passwordError: Bool = false
    @State private var emailError: Bool = false
    @State private var confirmPasswordError: Bool = false
    @State private var signUpPassword = ""
    @State private var eyeButtonVisible = false
    @State private var confirmPassword = ""
    
    let passwordPolicy: String = "Password must be alphanumeric\n 1) At least 6 characters\n 2) At lease one Uppercase\n 3) At least one Lowercase\n 4) At lease one special character\n 5) At least one Number"
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                HStack {
                    TextField("Email", text: $signUpEmail)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .onTapGesture {
                            emailError = false
                        }
                } //: HSTACK
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(signUpEmail != "" ? (emailError ? Color.red : Color.blue) : Color.gray.opacity(0.8), lineWidth: signUpEmail != "" ? 2 : 1)
                )
                if emailError {
                    Text("Please Enter valid email")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading) {
                HStack {
                    if(eyeButtonVisible) {
                        TextField("Password", text: $signUpPassword)
                            .onTapGesture {
                                passwordError = false
                            }
                    } else {
                        SecureField("Password", text: $signUpPassword)
                            .onTapGesture {
                                passwordError = false
                            }
                    }
                    Button(action: {
                        eyeButtonVisible.toggle()
                    }, label: {
                        Image(systemName: eyeButtonVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.blue)
                    })
                } //: HSTACK
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(signUpPassword != "" ? (passwordError ? Color.red : Color.blue) : Color.gray.opacity(0.8), lineWidth: signUpPassword != "" ? 2 : 1)
                )
                if passwordError {
                    Text(passwordPolicy)
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
            }
            
                VStack(alignment: .leading) {
                    HStack {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .onTapGesture {
                                confirmPasswordError = false
                            }
                        if(!signUpPassword.isEmpty && !confirmPassword.isEmpty) {
                            if(signUpPassword == confirmPassword) {
                                Image(systemName: "checkmark.circle.fill")
                                    // .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemGreen))
                                    //.padding(.trailing, 15)
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                  //  .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemRed))
                                   // .padding(.trailing, 15)
                            }
                        }
                    } //: HSTACK
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(confirmPassword != "" ? (confirmPasswordError ? Color.red : Color.blue) : Color.gray.opacity(0.8), lineWidth: confirmPassword != "" ? 2 : 1)
                    )
                    if confirmPasswordError {
                        Text("Both the passwords must be same")
                            .font(.footnote)
                            .foregroundColor(.red)
                    }
                }

            Button(action: {
                if(validations()) {
                    emailError = false
                    passwordError = false
                    confirmPasswordError = false
                    if(self.coreDataViewModel.fetchUser(email: signUpEmail) == nil) {
                        self.coreDataViewModel.addUser(email: signUpEmail, password: signUpPassword)
                    }
                    authViewModel.registerUser(email: signUpEmail, password: signUpPassword)
                }
            }, label: {
                HStack {
                    Spacer()
                    Text("Sign Up")
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
            .opacity(signUpEmail == "" || signUpPassword == "" || confirmPassword == "" ? 0.7 : 1)
            .disabled(signUpEmail == "" || signUpPassword == "" || confirmPassword == "")
            .padding(.top, 25)
            Spacer()
            
        } //: VSTACK
        .padding(.horizontal)
        .padding(.bottom, 30)
        
       
    }
    
    func validations() -> Bool {
        var res: Bool = true
        if(!authViewModel.emailValidation(signUpEmail)) {
            res = false
            emailError = true
        }
        if(!authViewModel.passwordValidation(signUpPassword)) {
            res = false
            passwordError = true
        }
        if(signUpPassword != confirmPassword) {
            res = false
            confirmPasswordError = true
        }
        return res
    }
}

struct SignUpTextboxView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTextboxButtonView()
    }
}
