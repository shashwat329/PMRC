//
//  MetroNavigationView.swift
//  patna metro
//
//  Created by shashwat singh on 15/02/25.
//

import SwiftUI

struct MetroNavigationView2: View {
    @State private var source: String = ""
    @State private var destination: String = ""
    @State private var route: [String] = []
    
    let metro = MetroNetwork()
    let stations: [String] = [
        "Danapur Cantonment", "Saguna More", "RPS More", "Patliputra", "Rukanpura",
        "Raja Bazar", "Patna Zoo", "Vikas Bhawan", "Vidyut Bhawan", "Patna Junction",
        "Mithapur", "Ramkrishna Nagar", "Jaganpur", "Khemni Chak", "Akashvani",
        "Gandhi Maidan", "PMCH", "Patna University", "Moin Ul Haq Stadium", "Rajendra Nagar",
        "Malahi Pakri", "Bhoothnath", "Zero Mile", "New ISBT"
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 15) {
                SearchableTextField(title: "Select Source", text: $source, options: stations)
                SearchableTextField(title: "Select Destination", text: $destination, options: stations)
            }
            
            Button(action: {
                if let foundRoute = metro.findShortestPath(from: source, to: destination) {
                    route = foundRoute
                } else {
                    route = ["No route found"]
                }
            }) {
                Text("Find Route")
                    .font(.title2.bold())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(route, id: \..self) { station in
                        HStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 10, height: 10)
                            Text(station)
                                .font(.headline)
                        }
                    }
                }
                .padding()
                .border(Color.black ,width: 2)
            }
            .frame(maxWidth: .infinity, minHeight: 200)
            .cornerRadius(10)
            .padding()
        }
        .padding()
    }
}

struct SearchableTextField: View {
    var title: String
    @Binding var text: String
    var options: [String]
    
    @State private var showDropdown = false
    
    var body: some View {
        VStack {
            TextField(title, text: $text, onEditingChanged: { _ in
                showDropdown = true
            })
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

#Preview {
    MetroNavigationView2()
}
