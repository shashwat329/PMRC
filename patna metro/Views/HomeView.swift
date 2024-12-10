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
                    Circle()
                        .fill()
                        .frame(width: 60)
                        .overlay{
                            Text("s".capitalized)
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                        }
                    Spacer()
                    Text("Welcome to Patna Metro")
                        .font(.title)
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
