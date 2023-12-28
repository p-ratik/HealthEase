//
//  PasswordPolicyView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 03/08/23.
//

import SwiftUI

struct PasswordPolicyView: View {
    @Binding var showModal: Bool
    @State private var b: Bool = false
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding()
            
            Button(action: {
                showModal = false
            }, label: {
               Text("Close")
            })
        }
        
        .frame(width: 200, height: 240)
        .background(Color.gray)
        .cornerRadius(12)
        .scaleEffect(b ? 1.4 : 1)
        .animation(.easeOut(duration: 0.3), value: b)
        .onAppear(perform: {
           
                b = true
        })
        
    }
}

