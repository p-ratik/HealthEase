//
//  FilteredDoctorDataGridView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 14/08/23.
//

import SwiftUI

struct FilteredDoctorDataGridView: View {
    var doctor: [Doctor]
    var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    var body: some View {
        VStack {
            SectionTitleView(text: "Doctors")
                .padding()
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 5) {
                ForEach(doctor) { doctor in
                    NavigationLink(destination: {
                        DoctorDetailView(doctor: doctor)
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        FilteredDoctorGridItemView(doctor: doctor)
                            .padding(.top, 10)
                    })
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

