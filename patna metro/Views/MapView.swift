//
//  MapView.swift
//  patna metro
//
//  Created by shashwat singh on 26/02/25.
//

import SwiftUI

struct MapView: View {
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea(.all)
                    Image("PatnaMetroRoute")
                        .resizable()
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    scale = lastScale * value
                                            }
                                .onEnded { _ in
                                                lastScale = scale
                                            }
                                    )
                                    .animation(.easeInOut, value: scale)
                
        }
    }
}

#Preview {
    MapView()
}
