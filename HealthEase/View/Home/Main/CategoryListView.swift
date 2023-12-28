//
//  CategoryListView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 10/08/23.
//

import SwiftUI
import Kingfisher

struct CategoryListView: View {
    @EnvironmentObject var readViewModel: ReadViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var categoryName: String
    var body: some View {
        VStack {
            CustomHeaderView(titleName: categoryName)
                .padding(.top, 30)
            List(readViewModel.doctors) { doctor in
                if(doctor.category == categoryName) {
                    NavigationLink(destination: {
                        DoctorDetailView(doctor: doctor)
                    }, label: {
                        CategoryListItemView(doctor: doctor)
                    })
                }
            }
            .toolbar(.hidden)
            .scrollContentBackground(.hidden)
            .background(Color.gray.opacity(0.2))
        }
        
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(categoryName: "Cardiologist")
            .environmentObject(ReadViewModel())
    }
}
