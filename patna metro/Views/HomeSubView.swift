//
//  HomeSubView.swift
//  patna metro
//
//  Created by shashwat singh on 28/07/25.
//

import SwiftUI

struct HomeSubView: View {
         let mainLine: String
         let secondLine: String
         let moduleID: Int
        let imageurl: String
        var body: some View {
            NavigationLink(destination: destinationView) {
                HStack {
                    Image(systemName: imageurl)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .shadow(radius: 2)
            }
            .navigationBarHidden(true)
            
        }

        @ViewBuilder
        private var destinationView: some View {
            switch moduleID {
                case 0:
                    MetroNavigationView()
                case 1:
                    MapView()
                case 2:
                    MetroNavigationView()
                case 3:
                    ParkingLotsView()
                case 4:
                    EmptyView()
                default:
                    Text("Unknown View")
            }
        }
    }
    #Preview {
        HomeSubView(mainLine: "Find your route",secondLine: "Start, end and time",moduleID: 0, imageurl: "square.and.arrow.up")
    }
