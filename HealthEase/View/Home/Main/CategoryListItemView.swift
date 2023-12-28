//
//  CategoryListItemView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 10/08/23.
//

import SwiftUI
import Kingfisher

struct CategoryListItemView: View {
    @EnvironmentObject var readViewModel: ReadViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var coreDataViewModel: CoreDataViewModel
    @State private var isFavourite: Bool = false
    var doctor: Doctor
    let randomColor: Color = Colors.randomColor()
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                randomColor
                    .frame(width: 65, height: 50)
                    .cornerRadius(12)
                    .offset(y: 10)
                
                KFImage(URL(string: doctor.image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text(doctor.name)
                    .fontWeight(.bold)
                Text(doctor.speciality)
                    .font(.footnote)
                    .foregroundColor(.blue)
                HStack {
                    Image("clinic")
                    Text(doctor.clinicName)
                        .foregroundColor(Color(red: 46/255, green: 92/255, blue: 40/255))
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Spacer()
                }
            }
            .background(
                Color.black.opacity(0.5)
                    .frame(width: 2)
                    .position(x: -12, y: 30)
            )
            
            Button(action: {
                if(!isFavourite) {
                    if(coreDataViewModel.addToFavourites(id: doctor.id, user: authViewModel.currentUser!)) {
                        isFavourite = true
                    }
                }
                else {
                    if(coreDataViewModel.deleteFromFavorites(id: doctor.id, email: (authViewModel.currentUser?.email)!)) {
                        isFavourite = false
                    }
                }
            }, label: {
                if(isFavourite) {
                    Image(systemName: "star.fill")
                        .renderingMode(.template)
                        .foregroundColor(.yellow)
                }
                else {
                    Image(systemName: "star")
                        .renderingMode(.template)
                        .foregroundColor(.yellow)
                }
                
            })
            .padding(.trailing, 5)
            .buttonStyle(PlainButtonStyle())  
        }
        .background(Color.white)
        .onAppear(perform: {
            if let favData = authViewModel.currentUser?.toFavourite?.allObjects as? [Favourite] {
                if(!favData.isEmpty) {
                    isFavourite = favData.contains { $0.id == doctor.id }
                }
                else {
                    isFavourite = false
                }
            }
        })
    }
}

