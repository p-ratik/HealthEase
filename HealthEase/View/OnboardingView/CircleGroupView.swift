//
//  CircleGroupView.swift
//  Restart
//
//  Created by Pratik Chougule on 20/06/23.
//

import SwiftUI

struct CircleGroupView: View {
    @State private var isAnimating: Bool = false

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.2), lineWidth: 70)
                .frame(width: 260, height: 260, alignment: .center)
                .scaleEffect(isAnimating ? 1 : 0.4)
                .animation(.easeOut(duration: 3).repeatForever(autoreverses: false), value: isAnimating)
            Circle()
                .stroke(Color.white.opacity(0.2), lineWidth: 110)
                .frame(width: 260, height: 260, alignment: .center)
                
        } //: ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1.3), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView()
        }
        
        
    }
}

