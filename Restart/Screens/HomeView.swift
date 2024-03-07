//
//  HomeView.swift
//  Restart
//
//  Created by Shazeen Thowfeek on 06/03/2024.
//

import SwiftUI

struct HomeView: View {
    //MARK: -property
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    //MARK: body
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
           //MARK: header
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(Animation
                    .easeInOut(duration: 4)
                    .repeatForever(),
                           value: isAnimating)
            }
            //MARK: center
            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            //MARK: footer
            Spacer()
            
            Button {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
                
            } label: {
                
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3,design: .rounded))
                    .fontWeight(.bold)
                
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }//: VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

#Preview {
    HomeView()
}
