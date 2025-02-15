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
                ScrollView{
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
                    ForEach(MenuItems,id: \.self){ item in
                        HomeViewRow(mainLine: item.mainLine, secondLine: item.secondLine,moduleID: item.moduleID)
                    }
                    .padding(.horizontal)

                }
                .padding(.top,-20)
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
