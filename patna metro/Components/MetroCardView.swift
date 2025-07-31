//
//  MetroCardView.swift
//  patna metro
//
//  Created by shashwat singh on 31/07/25.
//

import SwiftUI

struct MetroCardView: View {
    @State private var showToast = false
    var cardNumber: String = "4269 4794 2022"
    var issuedDate: String = "11/2022"

    var themeGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color.red, Color.orange, Color.yellow,
            Color(hex: "#1eacfa")
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    var body: some View {
        ZStack {
            themeGradient
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(radius: 4)

            VStack(spacing: 12) {
                HStack {
                    Text("ONE")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                        .tracking(2)
                        .rotationEffect(.degrees(-90))
                        .padding(.leading, 10)

                    Spacer()

                    VStack(alignment: .trailing, spacing: 4) {
                        Text("ONE DELHI. ONE RIDE.")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("वन | एक दिल्ली, एक सवारी")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.85))
                        Text("DELHI METRO")
                            .font(.footnote.bold())
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding(.trailing, 10)
                }

                Spacer()

                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("CARD NO.")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.7))

                        HStack {
                            Text(cardNumber)
                                .font(.title2.bold())
                                .foregroundColor(.white)

                            Button {
                                UIPasteboard.general.string = cardNumber
                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                withAnimation {
                                    showToast = true
                                }

                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                    withAnimation {
                                        showToast = false
                                    }
                                }

                            } label: {
                                Image(systemName: "doc.on.doc")
                                    .foregroundColor(.white)
                                    .padding(6)
                                    .background(Color.white.opacity(0.2))
                                    .clipShape(Circle())
                            }
                        }
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 4) {
                        Text("ISSUED")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.7))
                        Text(issuedDate)
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                }
                .padding([.horizontal, .bottom], 16)
            }
            .padding(.top, 20)

            if showToast {
                VStack {
                    Spacer()
                    Text("Copied to clipboard!")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color.black.opacity(0.75))
                        .cornerRadius(10)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .padding(.bottom, 20)
                }
                .animation(.easeInOut, value: showToast)
            }
        }
        .frame(width: 340, height: 210)
        
    }
}

#Preview {
    MetroCardView()
}
