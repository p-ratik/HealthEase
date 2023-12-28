//
//  AppointmentConfirmationItemView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 17/08/23.
//

import SwiftUI

struct AppointmentConfirmationItemView: View {
    @EnvironmentObject var coredataViewModel: CoreDataViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    var buttonText: String
    @Binding var appointments: [Appointment]?
    
    var appointmentData: Appointment
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 30){
                AppointmentConfirmationItemPartView(title: "Date", value: appointmentData.date ?? "")
                AppointmentConfirmationItemPartView(title: "Time", value: appointmentData.time ?? "")
                AppointmentConfirmationItemPartView(title: "Doctor", value: appointmentData.doctorName ?? "")
            }
            HStack(){
                AppointmentConfirmationItemPartView(title: "Type", value: appointmentData.speciality ?? "")
                Spacer()
                Button(action: {
                    if(coredataViewModel.removeFromAppointment(id: appointmentData.id!, date: appointmentData.date!, time: appointmentData.time!, doctorName: appointmentData.doctorName!, email: (authViewModel.currentUser?.email)!)) {
                        appointments = authViewModel.currentUser?.toAppointment?.allObjects as? [Appointment]
                    }
                }, label: {
                    HStack {
                        Text(buttonText)
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                    }
                    .background(Color(red: 236/255, green: 90/255, blue: 92/255))
                    .cornerRadius(5)
                    .shadow(radius: 4, x: 2, y: 2)
                    .padding(.top, 10)
                })
                .padding(.trailing, 30)
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 40)
        .background(Color.white)
        .cornerRadius(6)
        .foregroundColor(Color.black)
    }
}

struct AppointmentConfirmationItemPartView : View {
    var title: String
    var value: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.system(size: 14))
                .fontWeight(.semibold)
        }
    }
}
