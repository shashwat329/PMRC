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

                    Text("Welcome to Patna Metro")
                        .font(.title)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(hex: "#1eacfa"))
//                .background(Color(hex: "#96daff"))
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
