//
//  FavoriteDoctorsView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 21/08/23.
//

import SwiftUI

struct FavoriteDoctorsView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var readViewModel: ReadViewModel
    var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var favoritesData: [Favourite]?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Favourites")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .shadow(color: Color.gray.opacity(0.5),radius: 2, x: 2, y: 1)
                    .padding(.top, 30)
                
                ZStack {
                    Color.gray.opacity(0.2)
                        .edgesIgnoringSafeArea(.all)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 15) {
                                ForEach(readViewModel.doctors) { doctor in
                                    if(favoritesData != nil) {
                                        ForEach(favoritesData!, id: \.self) { fav in
                                            if(doctor.id == fav.id) {
                                                NavigationLink(destination: {
                                                    DoctorDetailView(doctor: doctor)
                                                }, label: {
                                                    FavoriteDoctorsItemView(favoritesData: $favoritesData, doctor: doctor)
                                                })
                                            }
                                        }
                                    }
                                    else {
                                        VStack {
                                            Text("No Favorites")
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 15)
                        }
                        .padding(.top, 25)
                        
                    }
                }
            }
            .onAppear(perform: {
                if let favorites = authViewModel.currentUser?.toFavourite?.allObjects as? [Favourite] {
                    favoritesData = favorites
                }
            })
        }
        
        
    }
}

struct FavoriteDoctorsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteDoctorsView()
    }
}
