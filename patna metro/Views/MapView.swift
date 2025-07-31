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
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                Color.clear.ignoresSafeArea()

                VStack(alignment: .center, spacing: 0) {
                    Image("Map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(scale)
                        .offset(offset)
                        .gesture(
                            SimultaneousGesture(
                                MagnificationGesture()
                                    .onChanged { value in
                                        let newScale = lastScale * value
                                        scale = min(max(newScale, 0.5), 4.0)
                                    }
                                    .onEnded { _ in
                                        lastScale = scale
                                    },

                                DragGesture()
                                    .onChanged { value in
                                        offset = CGSize(
                                            width: lastOffset.width + value.translation.width,
                                            height: lastOffset.height + value.translation.height
                                        )
                                    }
                                    .onEnded { _ in
                                        lastOffset = offset
                                    }
                            )
                        )
                        .onTapGesture(count: 2) {
                            if scale < 2.0 {
                                scale = 2.0
                            } else {
                                scale = 1.0
                                offset = .zero
                                lastOffset = .zero
                            }
                            lastScale = scale
                        }
                        .animation(.easeInOut(duration: 0.2), value: scale)
                        .padding(.top, 20) // Optional top spacing

                    Spacer() // Pushes content to the top
                }
                .frame(width: geo.size.width, alignment: .top)
            }
        }
    }
}


#Preview {
    MapView()
}
