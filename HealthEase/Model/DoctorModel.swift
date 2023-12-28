//
//  DoctorModel.swift
//  HealthEase
//
//  Created by Pratik Chougule on 09/08/23.
//

import Foundation


struct Doctor: Codable, Identifiable {
    let id: String
    let name: String
    let speciality: String
    let category: String
    let clinicName: String
    let image: String
    let experience: String
    let patients: String
    let rating: String
    let about: String
    let timeSlots: String
}
