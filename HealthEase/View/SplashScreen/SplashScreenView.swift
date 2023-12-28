//
//  SplashScreenView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 03/08/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var loadContentView: Bool = false

    var body: some View {
        
            ZStack {
                if(loadContentView) {
                    ContentView()
                }
                else {
                    HStack {
                        Image("splashLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        
                        Text("HealthEase")
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                            .foregroundColor(.blue).opacity(0.8)
                        .background(
                            Color.blue
                                .frame(height: 7).opacity(0.8)
                                .offset(y: 25)
                        )
                        
                        
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                 //   loadContentView = true
                })
            })
            .ignoresSafeArea()
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
