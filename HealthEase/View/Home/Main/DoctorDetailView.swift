//
//  DoctorDetailView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 10/08/23.
//

import SwiftUI
import Kingfisher

struct DoctorDetailView: View {
    var doctor: Doctor
    var body: some View {
        VStack {
            CustomHeaderView(titleName: doctor.name)
                .padding(.top, 30)
            ZStack {
                Color.gray.opacity(0.2)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 25) {
                        HStack {
                            Spacer()
                            KFImage(URL(string: doctor.image))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .padding(.top)
                            Spacer()
                        }
                        VStack(alignment: .leading, spacing: 13) {
                            HStack(spacing: 5) {
                                Text(doctor.speciality)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black.opacity(08))
                                Image(systemName: "checkmark.seal.fill")
                                    .renderingMode(.template)
                                    .foregroundColor(.blue)
                            }
                            Text(doctor.clinicName)
                                .foregroundColor(Color.white)
                                .padding(6)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .background(
                                    Color(red: 32/255, green: 92/255, blue: 30/255).opacity(0.8)
                                )
                                .cornerRadius(5)
                            RatingView(rating: doctor.rating)
                            HStack(spacing: 20){
                                VStack{
                                    Text("Patients")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                    Text(doctor.patients)
                                        .font(.title3)
                                }
                                .padding(10)
                                .padding(.horizontal, 5)
                                .foregroundColor(.white)
                                .background(
                                    Color(red: 95/255, green: 192/255, blue: 243/255)
                                )
                                .cornerRadius(5)
                                .shadow(radius: 5, x: 1, y: 1)
                                VStack{
                                    Text("Experience")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                    Text(doctor.experience)
                                        .font(.title3)
                                }
                                
                                .padding(10)
                                .padding(.horizontal, 5)
                                .foregroundColor(.white)
                                .background(
                                    Color(red: 146/255, green: 117/255, blue: 239/255)
                                )
                                .cornerRadius(5)
                                .shadow(radius: 5, x: 1, y: 1)
                            }
                            .padding(.bottom, 8)
                            Divider()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("About \(doctor.name)")
                                    .fontWeight(.semibold)
                                Text(doctor.about)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                            }
                            
                            NavigationLink(destination: {
                                ConfirmAppointmentView(doctor: doctor)
                                    .navigationBarBackButtonHidden(true)
                            }, label: {
                                HStack {
                                    Spacer()
                                    Text("Book an Appointment")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .padding(.vertical)
                                    Spacer()
                                }
                                .background(Color(red: 40/255, green: 92/255, blue: 189/255))
                                .cornerRadius(5)
                                .shadow(radius: 4, x: 2, y: 2)
                                .padding(.trailing)
                                .padding(.top, 10)
                            })
                        }
                        .padding(.leading)
                        Spacer()
                    }
                    .border(Color.black.opacity(0.13))
                    .background(Color.white)
                    //.cornerRadius(12)
                    .padding(20)
                }
            }
        }
        .toolbar(.hidden)
    }
}

struct DoctorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorDetailView(
        doctor: Doctor(id: "1", name: "Demo", speciality: "Demo", category: "Demo", clinicName: "Demo", image: "doc-4", experience: "Demo", patients: "Demo", rating: "5", about: "Demo", timeSlots: "Demo"))
    }
}
