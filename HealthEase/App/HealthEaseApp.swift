//
//  HealthEaseApp.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI
import Kingfisher
import Firebase

@main
struct HealthEaseApp: App {
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var readViewModel = ReadViewModel()
    @StateObject var networkMonitor = NetworkMonitor()
    @StateObject var coreDataViewModel = CoreDataViewModel()
    
    init() {
        FirebaseApp.configure()
        let cache = ImageCache.default.diskStorage
        cache.config.expiration = .days(7)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
                .environmentObject(readViewModel)
                .environmentObject(coreDataViewModel)
        }
        
    }
}
