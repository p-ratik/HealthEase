//
//  DoctorHomeView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI

struct DoctorHomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var readViewModel: ReadViewModel
    @EnvironmentObject var coreDataViewModel: CoreDataViewModel
    @AppStorage("currentUserEmail") var currentUserEmail: String = ""
    @State private var searchedText: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.2)
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        HomeTopView(searchText: $searchedText)
                        if(searchedText == "") {
                            DoctorCoverView()
                            SectionTitleView(text: "Categories")
                                .padding(.leading, 12)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack() {
                                    if !readViewModel.object.isEmpty {
                                        ForEach(readViewModel.object) { category in
                                            NavigationLink(destination: CategoryListView(categoryName: category.categoryName)
                                                .navigationBarBackButtonHidden(true)
                                                           , label: {
                                                CategoryItemView(category: category, width: 90, height: 90)
                                                    .padding(.leading, 10)
                                            })
                                        }
                                    } else {
                                        HStack(spacing: 10) {
                                            Text("Loading")
                                                .foregroundColor(.gray)
                                            LoadingView(color: Color.gray)
                                                .scaleEffect(0.5)
                                        }
                                        .padding(.horizontal, UIScreen.main.bounds.width/2 - 50)
                                    }
                                }
                                .padding(.horizontal, 12)
                            }
                            SectionTitleView(text: "Popular Doctors")
                                .padding(.leading, 12)
                            PopularDoctorItemView()
                            Spacer()
                        }
                        else {
                            let categoryFilteredData = filterCategoryData(stringToSearch: searchedText)
                            if(!categoryFilteredData.isEmpty) {
                                FilteredDataGridView(category: categoryFilteredData)
                            }
                            let docFilteredData = filterDoctorsData(stringToSearch: searchedText)
                            if(!docFilteredData.isEmpty) {
                                FilteredDoctorDataGridView(doctor: docFilteredData)
                            }  
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            readViewModel.getCategoryData()
            readViewModel.getDoctorsData()
            if let user = coreDataViewModel.fetchUser(email: currentUserEmail) {
                authViewModel.currentUser = user
            } 
        })
    }
    
    func filterCategoryData(stringToSearch: String) -> [Category] {
        return readViewModel.object.filter {$0.categoryName.contains(stringToSearch)}
    }
    
    func filterDoctorsData(stringToSearch: String) -> [Doctor] {
        return readViewModel.doctors.filter {$0.name.lowercased().contains(stringToSearch.lowercased())}
    }
}

struct DoctorHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorHomeView()
            .environmentObject(AuthViewModel())
            .environmentObject(ReadViewModel())
            .environmentObject(CoreDataViewModel())
    }
}
