//
//  MainView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 04/08/23.
//

import SwiftUI

struct DoctorCoverView: View {
    @EnvironmentObject var readViewModel: ReadViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                if(!readViewModel.doctorCover.isEmpty) {
                    ForEach(readViewModel.doctorCover) { cover in
                        DoctorCoverItemView(doctorCoverData: cover)
                            .padding(.leading, 10)
                    }
                } else {
                    HStack(spacing: 10) {
                        Text("Loading")
                            .foregroundColor(.gray)
                        LoadingView(color: Color.gray)
                            .scaleEffect(0.5)
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width/2 - 50)
                }
            }
            .padding(.horizontal, 10)
        }
        .onAppear(perform: {
            readViewModel.getCoverData()
        })
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorCoverView()
            .environmentObject(ReadViewModel())
        //.background(Color.black)
    }
}
