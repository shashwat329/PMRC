//
//  HomeView.swift
//  patna metro
//
//  Created by shashwat singh on 11/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Patna Metro")
                        .font(.title)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(hex: "#1eacfa"))
                HStack{
                    Image("HomepageBg")
                        .resizable()
                        .aspectRatio(CGFloat(6) / CGFloat(4), contentMode: .fit)
                        .overlay{
                            Color.black.opacity(0.3)
                            Text("welcome to Patna metro".capitalized)
                                .foregroundStyle(.white)
                                .font(.title)
                                .bold()
                        }
                }
                HStack{
                    VStack{
                        Text("Find your route")
                            .font(.headline)
                        Text("Start, end and time")
                            .font(.footnote)
                        Button("click Me"){
                            print("button pressed")
                        }
                        .padding(.horizontal,30)
                        .padding(.vertical,4)
                        .background(Color(hex: "#1eacfa"))
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                            
                    }
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: "#1eacfa"))
                        .frame(width: 150, height: 100)
                }.padding()
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
