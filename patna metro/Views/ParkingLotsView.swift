//
//  ParkingLotsView.swift
//  patna metro
//
//  Created by shashwat singh on 26/07/25.
//

import SwiftUI

struct ParkingLotsView: View {
    var body: some View {
        VStack{
            SearchableTextFieldView(placeholder: "Parking nearest Metro Station")
                .background(.ultraThinMaterial)
            ScrollView{
                ForEach(0..<6){index in
                    ParkingRow()
                }
            }
        }
    }
}
struct ParkingRow: View {
    @State private var showSheet = false
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("🚇 Rajiv Chowk Metro Station")
                .font(.headline)
            Text("🅿️ Connaught Place Parking")
                .font(.subheadline)
            HStack {
                Image(systemName: "mappin.and.ellipse")
                Text("A-Block, Inner Circle, CP")
                    .font(.caption)
            }
            HStack {
                Text("₹30/hour")
                    .font(.caption)
                    .padding(6)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
                Spacer()
                Button("🗺️ Get Directions") {
                    let address = "A-Block, Inner Circle, CP, Delhi"
                    let encoded = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                    if let url = URL(string: "http://maps.apple.com/?address=\(encoded)") {
                        UIApplication.shared.open(url)
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(radius: 5)
    }
}

#Preview {
//    ParkingRow()
    ParkingLotsView()
}
