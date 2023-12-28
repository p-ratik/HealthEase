//
//  FilteredDoctorGridItemView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 14/08/23.
//

import SwiftUI
import Kingfisher

struct FilteredDoctorGridItemView: View {
    var doctor: Doctor
    var body: some View {
        VStack(spacing: 10) {
            KFImage(URL(string: doctor.image))
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
                .foregroundColor(Color(red: 46/255, green: 92/255, blue: 40/255))
            
            Text(doctor.category)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(5)
                .background(Color.gray.opacity(0.5))
                .foregroundColor(.black)
                .cornerRadius(8)
            
        }
        .frame(width: 155, height: 160)
        .padding(8)
        .background(.white)
        .cornerRadius(7)
    }
}
