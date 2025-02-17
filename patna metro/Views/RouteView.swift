//
//  RouteView.swift
//  patna metro
//
//  Created by shashwat singh on 14/02/25.
//

import SwiftUI

struct RouteView: View {
    @State var source: String = ""
    @State var destination : String = ""
    var body: some View {
        HStack{
            VStack{
                Button {
//                    RouteSearchList()
                    print("this is route view")
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: .infinity,height: 60)
                        .padding()
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray,lineWidth: 4)
                                .padding()
                            if source.isEmpty{
                                HStack{
                                    Text("Select Source")
                                    Spacer()
                                    Image(systemName: "magnifyingglass")
                                        .font(.title)
                                }
                                .padding()
                                .padding()
                            }
                            else{
                                Text("\(source)")
                            }
                        }
                }

                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: .infinity,height: 60)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green,lineWidth: 4)
                            .padding()
                        if destination.isEmpty {
                            HStack{
                                Text("Select Destination")
                                Spacer()
                                Image(systemName: "magnifyingglass")
                                    .font(.title)
                            }
                            .padding()
                            .padding()
                        }

                        }
            }
        }
        
    }
}

#Preview {
    RouteView()
}
