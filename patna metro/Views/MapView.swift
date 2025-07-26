//
//  MapView.swift
//  patna metro
//
//  Created by shashwat singh on 26/02/25.
//

import SwiftUI

struct MapView: View {
    @State private var scale: CGFloat = 0.5
    @State private var lastScale: CGFloat = 1.0
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea(.all)
            ScrollView([.horizontal, .vertical]) {
                Image("PatnaMetroRoute")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scale)
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                let newScale = lastScale * value
                                scale = min(max(newScale, 0.3), 6.0)
                            }
                            .onEnded { _ in
                                lastScale = scale
                            }
                    )
                    .animation(.easeInOut(duration: 0.2), value: scale)
                    .onTapGesture (count: 2){
                        if scale < 2.0{
                            scale = 2.0
                        }
                        else{
                            scale = 1.0
                        }
                        lastScale = scale
                    }
                    .animation(.easeInOut(duration: 0.2), value: scale)
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    MapView()
}
