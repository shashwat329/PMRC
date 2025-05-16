//
//  animatedLaunchScreen.swift
//  patna metro
//
//  Created by shashwat singh on 15/05/25.
//

import SwiftUI

struct animatedLaunchScreen: View {
    var body: some View {
        ZStack{
            Color(hex: "#1097F0")
                .ignoresSafeArea()
            VStack{
                Spacer()
                LottieView(filename: "launchscreenanimation")
                    .frame(maxWidth: .infinity)
                    
                Text("made with ❤️ by Shashwat")
                    .foregroundColor(.white)
            }
            .ignoresSafeArea(edges: [.leading,.trailing,.top])
        }
       
    }
}

#Preview {
    animatedLaunchScreen()
}
