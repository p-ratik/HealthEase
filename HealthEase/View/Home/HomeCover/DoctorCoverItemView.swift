//
//  DoctorCoverView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 04/08/23.
//

import SwiftUI
import Kingfisher

struct DoctorCoverItemView: View {
    var doctorCoverData: DoctorCover
    var body: some View {
       
            HStack {
                VStack(alignment: .leading) {
                    Text("Looking For Your Desire Specialist Doctor?")
                        .minimumScaleFactor(0.8)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text(doctorCoverData.name)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                        Text(doctorCoverData.speciality)
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Text(doctorCoverData.clinicName)
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .background(
                        Color.green
                            .frame(width: 4)
                            .position(x: -10, y: 30)
                    )
                    .padding(.leading, 12)
                    Spacer()
                }
                .padding(.leading, 5)
                
                KFImage(URL(string: doctorCoverData.image))
                    .resizable()
                    .placeholder({
                        LoadingView(color: Color.white)
                            .scaleEffect(0.5)
                    })
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.top, 30)
            }
        
        .frame(width: UIScreen.main.bounds.width - 50 ,height: 180)
        .padding(.leading,0)
        .background(Color(red: 65/255, green: 115/255, blue: 222/255))
        .cornerRadius(15)
        
    }
}

