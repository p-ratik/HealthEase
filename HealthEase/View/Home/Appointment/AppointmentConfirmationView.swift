//
//  AppointmentConfirmationView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 17/08/23.
//

import SwiftUI

struct AppointmentConfirmationView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var appointments: [Appointment]? = nil
    @State private var activeAppointments: Bool = true
    @State private var pastAppointments: Bool = false
    
    var body: some View {
        VStack {
            Text("My Appointments")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .shadow(color: Color.gray.opacity(0.5),radius: 2, x: 2, y: 1)
                .padding(.top, 30)
            ZStack {
                Color.gray.opacity(0.2)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack(spacing: 10) {
                        Button(action: {
                            activeAppointments = true
                            pastAppointments = false
                        }, label: {
                            Text("Active Appointments")
                                .foregroundColor(activeAppointments ? .white : .black)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .padding()
                        })
                        .background(activeAppointments ? Color(red: 40/255, green: 92/255, blue: 189/255) : .white)
                        .cornerRadius(5)
                        .shadow(radius: 4, x: 2, y: 2)
                        .padding(.top, 10)
                        
                        Button(action: {
                            activeAppointments = false
                            pastAppointments = true
                        }, label: {
                            Text("Past Appointments")
                                .foregroundColor(pastAppointments ? .white : .black)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .padding()
                        })
                        .background(pastAppointments ? Color(red: 40/255, green: 92/255, blue: 189/255) : .white)
                        .cornerRadius(5)
                        .shadow(radius: 4, x: 2, y: 2)
                        .padding(.top, 10)
                    }
                    .padding(.top)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        if(activeAppointments) {
                            VStack(spacing: 15) {
                                if let appointments = appointments {
                                    ForEach(appointments, id: \.self) { appointment in
                                        if(appointment.date! >= Date.now.formatted(date: .abbreviated, time: .omitted)) {
                                            AppointmentConfirmationItemView(buttonText: "Cancel", appointments: $appointments, appointmentData: appointment)
                                        }
                                        
                                    }
                                }
                            }
                            .padding(.vertical, 20)
                        }
                        else {
                            VStack(spacing: 15) {
                                if let appointments = appointments {
                                    ForEach(appointments, id: \.self) { appointment in
                                        if(appointment.date! < Date.now.formatted(date: .abbreviated, time: .omitted)) {
                                            AppointmentConfirmationItemView(buttonText: "Remove", appointments: $appointments, appointmentData: appointment)
                                        }
                                    }
                                }
                            }
                            .padding(.vertical, 20)
                        }
                        
                    }
                    
                }
                
            }
        }
        .onAppear(perform: {
            if(authViewModel.currentUser?.toAppointment?.allObjects != nil) {
                appointments = authViewModel.currentUser?.toAppointment?.allObjects as? [Appointment]
            }
        })
        
    }
}
