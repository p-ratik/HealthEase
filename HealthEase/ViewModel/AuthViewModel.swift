//
//  AuthViewModel.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import FirebaseAuth
import SwiftUI
import CoreData

class AuthViewModel: ObservableObject {
    
    @AppStorage("loggedIn") var isLoggedIn: Bool = false
    @AppStorage("currentUserEmail") var currentUserEmail: String = ""
    @Published var errorMssg: String = ""
    @Published var isErrorPresented: Bool = false
    @Published var currentUser: UserEntity? = nil
    
    func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [self] (result, error) in
            if let error = error {
                self.errorMssg = error.localizedDescription
                self.isErrorPresented = true
            }
            else {
                self.currentUserEmail = email
                self.isLoggedIn = true
            }
            
        }
    }
    
    func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let errorCode = error as NSError? {
                switch errorCode.code {
                case 17007:
                    self.errorMssg = "Email Id Already In Use."
                    self.isErrorPresented = true
                default:
                    print("some error occured")
                }
            }
            else {
                self.currentUserEmail = email
                self.isLoggedIn = true
            }
            
        }
    }
    
    func signOutUser() {
        do {
            try Auth.auth().signOut()
            self.currentUser = nil
            
            self.isLoggedIn = false
        }
        catch(let error as NSError) {
            print(error.localizedDescription)
        }
    }
    
    // MARK: Email ID Validation
    func emailValidation(_ email: String) -> Bool {
        let emailRegx = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegx)
        return emailPred.evaluate(with: email)
    }

    // MARK: Mobile Number Validation
    func mobileValidation(_ mobile: String) -> Bool {
        let mobileRegx = "[0-9]{10,10}"
        let mobilePred = NSPredicate(format: "SELF MATCHES %@", mobileRegx)
        return mobilePred.evaluate(with: mobile)
    }

    // MARK: Password Validation
    func passwordValidation(_ password: String) -> Bool {
        let passwordRegx = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[!@#$%&?._-]).{6,}"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegx)
        return passwordPred.evaluate(with: password)
    }

    // MARK: Confirm password validation
    func confirmPasswordValidation(_ password: String, _ confirmPassword: String) -> Bool {
        if (password == confirmPassword){
            return true
        }
        return false
    }
    
    
}
 
