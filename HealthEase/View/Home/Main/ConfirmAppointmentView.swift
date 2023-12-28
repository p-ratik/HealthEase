//
//  ConfirmAppointmentView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 16/08/23.
//

import SwiftUI

struct ConfirmAppointmentView: View {
    @EnvironmentObject var coreDataViewModel: CoreDataViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showAlert: Bool = false
    @State private var selectedTimeSlot: Substring = ""
    @State private var errorMessage: String = ""
    @State private var selectedDate = Date.now.addingTimeInterval(86400)
    var doctor: Doctor
    
    
    var body: some View {
        VStack {
            CustomHeaderView(titleName: doctor.name)
                .padding(.top, 30)
            ZStack {
                Color.gray.opacity(0.2)
                    .edgesIgnoringSafeArea(.all)
                Form {
                    DatePicker("Select Date", selection: $selectedDate, in: Date.now.addingTimeInterval(86400)... , displayedComponents: .date)
                        .padding(.vertical, 3)
                    let slots: [Substring] = doctor.timeSlots.split(separator: " ")
                    Picker("Select Slot", selection: $selectedTimeSlot ) {
                        ForEach(slots, id: \.self) { slot in
                            Text(slot).tag(slot)
                        }
                    }
                    .pickerStyle(.menu)
                    Button(action: {
                        if(!coreDataViewModel.checkIfAppointmentBooked(id: doctor.id, date: selectedDate.formatted(date: .abbreviated, time: .omitted), time: String(selectedTimeSlot), doctorName: doctor.name, email: authViewModel.currentUser?.email ?? "")) {
                            if(coreDataViewModel.addToAppointment(id: doctor.id, date: selectedDate.formatted(date: .abbreviated, time: .omitted), time: String(selectedTimeSlot), doctorName: doctor.name, doctorSpeciality: doctor.speciality, user: authViewModel.currentUser!)) {
                                errorMessage = "Appointment Booked Successfully!"
                                showAlert.toggle()
                            }
                        }
                        else {
                            errorMessage = "Appointment is already booked for selected time Slot"
                            showAlert.toggle()
                        }
                        
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Confirm Appointment")
                                .foregroundColor(.white)
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .padding(.vertical)
                            Spacer()
                        }
                        .background(Color(red: 40/255, green: 92/255, blue: 189/255))
                        .cornerRadius(5)
                        .shadow(radius: 4, x: 2, y: 2)
                        .padding(.top, 10)
                    })
                    .alert(errorMessage, isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }   
                }
            }
            .onAppear(perform: {
                selectedTimeSlot = doctor.timeSlots.split(separator: " ")[0]
            })
        }
    }
}


