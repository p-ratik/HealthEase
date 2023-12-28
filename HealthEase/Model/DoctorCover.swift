//
//  DoctorCover.swift
//  HealthEase
//
//  Created by Pratik Chougule on 04/08/23.
//

import Foundation


struct DoctorCover: Codable, Identifiable  {
    let id: String
    let name: String
    let speciality: String
    let clinicName: String
    let image: String
}
