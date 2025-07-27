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
                    HStack{
                        Text("main")
                        .font(.title)
                        .bold()
                        Spacer()
                    }
                    .padding(.horizontal)
                    ForEach(MenuItems,id: \.self){ item in
                        HomeViewRow(mainLine: item.mainLine, secondLine: item.secondLine,moduleID: item.moduleID, imageurl: item.imageurl)
                           
                            .shadow(radius: 2)
                    }
                    .padding(.horizontal)
                    HStack{
                        Text("main")
                        .font(.title)
                        .bold()
                        Spacer()
                    }
                    .padding(.horizontal)
                    ForEach(MenuItems,id: \.self){ item in
                        HomeSubView(mainLine: item.mainLine, secondLine: item.secondLine,moduleID: item.moduleID, imageurl: item.imageurl)
                           
                            .shadow(radius: 2)
                    }
                    .padding(.horizontal)

                    
                }
                
                .ignoresSafeArea(edges: .top)
                
            }
        }
    }
}

#Preview {
    HomeView()
}
