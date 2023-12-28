//
//  ProfileView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Text("Profile")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .shadow(color: Color.gray.opacity(0.5),radius: 2, x: 2, y: 1)
                .padding(.top, 30)
            
            ZStack {
                Color.gray.opacity(0.2)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 30){
                    
                    Image(systemName: "person.fill")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .padding(25)
                        .frame(width: 140, height: 140)
                        .background(
                        Circle()
                            .fill(Color.white)
                            
                        )
                        .background(
                            Circle()
                                .stroke(Color.black, lineWidth: 0.3)
                        )
                    
                    HStack {
                        Text("Email: ")
                            .fontWeight(.semibold)
                        Text(authViewModel.currentUser?.email ?? "")
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .padding(.horizontal)
                    .background(.white)
                    .cornerRadius(12)
                    .padding(.top)
            
                    Button(action: {
                        authViewModel.signOutUser()
                    }, label: {
                        HStack {
                            Text("Logout")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                        .padding(10)
                        .padding(.horizontal, 5)
                        .background(Color.blue)
                        .cornerRadius(8)
                       
                    })
                    Spacer()
                }
                .padding(.top, 50)
               
            }
        }  
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}
