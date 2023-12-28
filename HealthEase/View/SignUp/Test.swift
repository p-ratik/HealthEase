//
//  Test.swift
//  HealthEase
//
//  Created by Pratik Chougule on 03/08/23.
//

import SwiftUI

struct Test: View {
    @State var isActive: Bool = false
    var body: some View {
        
        ZStack {
            VStack {
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Spacer()
                Button(action: {
                    isActive = true
                }, label: {
                    Text("Exit")
                })
                Spacer()
            }
            if(isActive) {
                PasswordPolicyView(showModal: $isActive)
            }
        }
        
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
