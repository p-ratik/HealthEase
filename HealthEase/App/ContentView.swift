//
//  ContentView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isUnlocked = false
    @AppStorage("loggedIn") var isLoggedIn: Bool = false
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        Group {
            if(isUnlocked) {
                if(isOnboardingViewActive) {
                    OnboardingView()
                }
                else if(isLoggedIn) {
                        DoctorTabView()
                    }
                    else {
                        LoginView()
                    }
            }
            
        }
        .onAppear(perform: {
            authenticate()
        })
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            // check whether biometric authentication is possible
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                // it's possible, so go ahead and use it
                let reason = "We need to unlock your data."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    // authentication has now completed
                    if success {
                        // authenticated successfully
                        isUnlocked = true
                    } else {
                        // there was a problem
                        authenticate()
//                        isUnlocked = true
                    }
                }
            } else {
                isUnlocked = true
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
