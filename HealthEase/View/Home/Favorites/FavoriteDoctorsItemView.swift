//
//  FavoriteDoctorsItemView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 21/08/23.
//

import SwiftUI
import Kingfisher

struct FavoriteDoctorsItemView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var coreDataViewModel: CoreDataViewModel
    @Binding var favoritesData: [Favourite]?
    var doctor: Doctor
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                KFImage(URL(string: doctor.image))
//                    .cacheMemoryOnly(true)
                    .resizable()
                    .placeholder({
                        LoadingView(color: Color.blue)
                            .scaleEffect(0.5)
                    })
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                
                Text(doctor.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text(doctor.category)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(5)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                
            }
            .frame(width: 155, height: 160)
            .padding(8)
            .background(
            LinearGradient(colors: [Color(red: 77/255, green: 88/255, blue: 222/255),
                                    Color(red: 97/255, green: 156/255, blue: 218/255)
                                   ], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(7)
            
            Button(action: {
                if(coreDataViewModel.deleteFromFavorites(id: doctor.id, email: (authViewModel.currentUser?.email)!)) {
                    if let favorites = authViewModel.currentUser?.toFavourite?.allObjects as? [Favourite] {
                        favoritesData = favorites
                    }
                }
            }, label: {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .offset(x: 60, y: -65)
                    .foregroundColor(.yellow)
            })
            .buttonStyle(PlainButtonStyle())
            
            
        }
        
    }
}

