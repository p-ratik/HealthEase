//
//  CustomTabView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 01/08/23.
//

import SwiftUI

struct DoctorTabView: View {
    
    @State var selectTab = "Home"
    let tabs = ["Home", "Favorites", "Appointments", "Profile"]
    
    var body: some View {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectTab) {
                    DoctorHomeView()
                        .tag("Home")
                    
                    FavoriteDoctorsView()
                        .tag("Favorites")
                        
                    AppointmentConfirmationView()
                        .tag("Appointments")
                    
                    ProfileView()
                        .tag("Profile")
                } //: TAB
                .padding(.vertical, 25)
                
                HStack {
                    ForEach(tabs, id: \.self) { tab in
                        CustomTabBarItem(tab: tab, selected: $selectTab)
                    }
                } //: HSTACK
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.white)
            } //: ZSTACK
            .edgesIgnoringSafeArea(.top)
    }
}

struct DoctorTabView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorTabView()
    }
}
