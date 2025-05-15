//
//  animatedLaunchScreen.swift
//  patna metro
//
//  Created by shashwat singh on 15/05/25.
//

import SwiftUI

struct animatedLaunchScreen: View {
    var body: some View {
        VStack{
            Spacer()
            LottieView(filename: "launchscreenanimation")
            Text("made with ❤️ by Shashwat")
                .foregroundColor(.blue)
        }
        .ignoresSafeArea(edges: [.leading,.trailing,.top])
    }
}

#Preview {
    animatedLaunchScreen()
}
