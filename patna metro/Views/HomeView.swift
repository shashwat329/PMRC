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
                                VStack{
                                    Text("welcome to Patna metro".capitalized)
                                        .foregroundStyle(.white)
                                        .font(.title)
                                        .bold()
                                    Text("Your journey made smarter")
                                        .foregroundColor(.white.opacity(0.8))
                                        .font(.subheadline)
                                }
                            }
                    }
                    HStack{
                        Text("Main Feathers")
                            .font(.title2.bold())
                        Spacer()
                    }
                    .padding(.horizontal)
                    ForEach(MenuItems,id: \.self){ item in
                        HomeViewRow(mainLine: item.mainLine, secondLine: item.secondLine ,moduleID: item.moduleID, imageurl: item.imageurl)
                           
                            .shadow(radius: 2)
                    }
                    .padding(.horizontal)
                    HStack{
                        Text("Quick Actions")
                            .font(.title2.bold())
                        Spacer()
                    }
                    .padding(.horizontal)
                    LazyVGrid(columns: columns) {
    
                        ForEach(menuSubItems, id: \.self) { item in
                            VStack{
                                if item.moduleID == 4 {
                                    ShareLink(
                                        item: URL(string: "https://shashwatt.in")!,
                                        subject: Text("Check this out!"),
                                        message: Text("Visit my portfolio site.")
                                    ) {
                                        VStack{
                                            Image(item.imageurl)
                                                .resizable()
                                                .frame(width: 50,height: 50)
                                           
                                        }
                                        .padding()
                                        .background(.ultraThinMaterial)
                                        .cornerRadius(20)
                                        .shadow(radius: 20,x: 0,y: 1)
                                    }
                                    Text(item.mainLine)
                                    
                                }
                                else{
                                    SubModuleView(image: item.imageurl, moduleID: item.moduleID, text: item.mainLine)
                                    Text(item.mainLine)
                                }
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
