//
//  OnboardingView.swift
//  Restart
//
//  Created by Pratik Chougule on 20/06/23.
//

import SwiftUI

struct OnboardingView: View {
    
    //MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: Double = 0
    @State private var isAnimating: Bool = false
    @State private var titletext: String = "HealthEase"
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                //MARK: - HEADER
                VStack(spacing: 0) {
                    Text(titletext)
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(titletext)
                    
                    Text("Connecting you with expert care, effortlessly")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y : isAnimating ? 0 : -45)
                .animation(.easeInOut(duration: 1), value: isAnimating)
                
                //MARK: - CENTER
                ZStack {
                    CircleGroupView()
                    Image("doctor")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .scaledToFit()
                        .padding()
                } //: CENTER
                
                //MARK: - FOOTER
                ZStack {
                    // 1. BACKGROUND(STATIC)
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(10)
                    
                    // 2. CALL-TO-ACTION(STATIC)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    // 3. CAPSULE (DYNAMIC WIDTH)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    
                    // 4. CIRCLE (DRAGGABLE)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                        } //: ZSTACK
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if(gesture.translation.width > 0 && buttonOffset <=
                                       buttonWidth - 80) {
                                        buttonOffset = gesture.translation.width
                                    }
                                    
                                })
                                .onEnded { _ in
                                    if(buttonOffset <= (buttonWidth/2) - 40) {
                                        buttonOffset = 0
                                    }
                                    else {
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingViewActive = false
                                    }
                                }
                        )
                        Spacer()
                    } //: HSTACK
                } //: ZSTACK
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 45)
                .animation(.easeOut(duration: 1), value: isAnimating)
            } //: VSTACK
        } //: ZSTACK
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

