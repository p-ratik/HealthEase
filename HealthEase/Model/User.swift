//
//  User.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import Foundation


struct User: Identifiable, Codable {
    var id: String
    var email: String
    var password: String
}
