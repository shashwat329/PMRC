//
//  HomeViewRow.swift
//  patna metro
//
//  Created by shashwat singh on 14/02/25.
//

import SwiftUI

struct HomeViewRow: View {
     let mainLine: String
     let secondLine: String
     let moduleID: Int
    var body: some View {
        NavigationLink(destination: destinationView) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(mainLine)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(secondLine)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: "#1eacfa"))
                    .frame(width: 150, height: 100)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 2)
        }
    }

    @ViewBuilder
    private var destinationView: some View {
        switch moduleID {
            case 0:
                MetroNavigationView()
            case 1:
                MetroNavigationView()
            case 2:
                MetroNavigationView()
            default:
                Text("Unknown View")
        }
    }
}
#Preview {
    HomeViewRow(mainLine: "Find your route",secondLine: "Start, end and time",moduleID: 0)
}
