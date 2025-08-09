//
//  ComingSoonView.swift
//  patna metro
//
//  Created by shashwat singh on 09/08/25.
//

import SwiftUI

struct ComingSoonView: View {
    @State private var fadeIn = false
    @State private var blink = true
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
              
                Image("logo")
                    .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 150)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .opacity(fadeIn ? 1 : 0)
                                        .offset(y: fadeIn ? 0 : 20)
                                        .animation(.easeOut(duration: 0.6), value: fadeIn)
                
                // Title
                HStack(spacing: 0) {
                    Text("Coming Soon")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color.blue.opacity(0.8), Color.blue],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .opacity(fadeIn ? 1 : 0)
                        .offset(y: fadeIn ? 0 : 20)
                        .animation(.easeOut(duration: 0.8).delay(0.2), value: fadeIn)
                    
                    // Blinking Cursor
                    Text("|")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.blue)
                        .opacity(blink ? 1 : 0)
                        .animation(.easeInOut(duration: 0.6).repeatForever(), value: blink)
                }
            }
            .multilineTextAlignment(.center)
        }
        .onAppear {
            fadeIn = true
            blink.toggle()
        }
    }
}

#Preview {
    ComingSoonView()
}

