//
//  HomeView.swift
//  patna metro
//
//  Created by shashwat singh on 11/12/24.
//

import SwiftUI

struct HomeView: View {
    let columns = [
          GridItem(.flexible()),
          GridItem(.flexible()),
          GridItem(.flexible())
      ]
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
                        HomeViewRow(mainLine: item.mainLine, secondLine: item.secondLine ,moduleID: item.moduleID, imageurl: item.imageurl)
                           
                            .shadow(radius: 2)
                    }
                    .padding(.horizontal)
                    HStack{
                        Text("menuSubItems")
                        .font(.title)
                        .bold()
                        Spacer()
                    }
                    .padding(.horizontal)
                    LazyVGrid(columns: columns) {
                        ForEach(menuSubItems, id: \.self) { item in
                            VStack{
                                SubModuleView(image: item.imageurl, moduleID: item.moduleID, text: item.mainLine)
                                Text(item.mainLine)
                            }
                        }
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
