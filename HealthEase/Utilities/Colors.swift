//
//  ColorExtension.swift
//  HealthEase
//
//  Created by Pratik Chougule on 10/08/23.
//

import Foundation
import SwiftUI

class Colors {
    static let colors = [Color(red: 92/255, green: 151/255, blue: 254/255),
                        Color(red: 204/255, green: 216/255, blue: 137/255),
                        Color(red: 242/255, green: 180/255, blue: 138/255),
                        Color(red: 106/255, green: 74/255, blue: 226/255),
                        Color(red: 168/255, green: 150/255, blue: 82/255),
                        Color(red: 82/255, green: 151/255, blue: 168/255),
                        Color(red: 138/255, green: 82/255, blue: 168/255),
                        Color(red: 86/255, green: 168/255, blue: 91/255)                   
    ]
    
    static func randomColor() -> Color {
        return colors.randomElement()!
    }
}
