//
//  SearchView.swift
//  patna metro
//
//  Created by shashwat singh on 15/02/25.
//

import SwiftUI

struct MetroNavigationView: View {
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
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .frame(height: 55)
                    TextField("Select Source", text: $source)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
               
                    
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .frame(height: 55)
                    TextField("Select Destination", text: $destination)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
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
            
            if !source.isEmpty {
                SearchableDropdown(text: $source, destination: $destination, options: stations)
            }
            if !destination.isEmpty{
                  SearchableDropdown(text: $source, destination: $destination, options: stations)
            }
            Spacer()
            
            
//            ScrollView {
//                VStack(alignment: .leading, spacing: 10) {
//                    ForEach(route, id: \..self) { station in
//                        HStack {
//                            Circle()
//                                .fill(Color.blue)
//                                .frame(width: 10, height: 10)
//                            Text(station)
//                                .font(.headline)
//                        }
//                    }
//                }
//                .padding()
//            }
//            .frame(maxWidth: .infinity, minHeight: 200)
//            .background(Color.blue.opacity(0.3))
//            .cornerRadius(10)
//            .padding()
        }
        .padding()
    }
}

struct SearchableDropdown: View {
    @Binding var text: String
    @Binding var destination: String
    var options: [String]
    
    @State private var showDropdown = false
    
    var body: some View {
        VStack {
            if showDropdown {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(options.filter { $0.lowercased().contains(text.lowercased()) || $0.lowercased().contains(destination.lowercased()) || text.isEmpty }, id: \..self) { option in
                            Text(option)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .onTapGesture {
                                    if text.isEmpty {
                                        destination = option
                                    } else {
                                        text = option
                                    }
                                    showDropdown = false
                                }
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }
        .onAppear { showDropdown = true }
    }
}

#Preview {
    MetroNavigationView()
}
