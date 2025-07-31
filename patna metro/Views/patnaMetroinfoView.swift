//
//  patnaMetroinfoView.swift
//  patna metro
//
//  Created by shashwat singh on 30/07/25.
//

import SwiftUI
struct PatnaMetroInfoView: View {
    let themeColor = Color(hex: "1eacfa")
    @State private var selectedLine = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // About Patna Metro
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(themeColor)
                            .font(.title2)
                        Text("About Patna Metro")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    Text("Patna Metro is a rapid transit system under construction by Patna Metro Rail Corporation Limited (PMRCL). The metro is expected to be operational by August 15, 2025, in time for Independence Day. Phase 1 covers approximately 31 km across two corridors with 24-26 planned stations. The project is funded jointly by State Government (20%), Central Government (20%), and 60% loan from Japan International Cooperation Agency (JICA).")
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal, 20)
                
                // Current Status
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "hammer.fill")
                            .foregroundColor(themeColor)
                            .font(.title2)
                        Text("Current Status")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    Text("The priority elevated section of the Blue Line (approximately 6.5 km) is nearly complete and set to begin operations by August 15, 2025. This section includes five key stations: Malahi Pakri, Khemni Chak, Bhootnath, Zero Mile, and New ISBT. Construction progress is above 90% in these areas, with final finishes and trial runs currently underway.")
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal, 20)
                
                // Line Selection
                VStack(spacing: 16) {
                    HStack {
                        Image(systemName: "map.fill")
                            .foregroundColor(themeColor)
                            .font(.title2)
                        Text("Metro Routes")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    // Line Buttons
                    HStack(spacing: 0) {
                        Button(action: { selectedLine = 0 }) {
                            VStack(spacing: 6) {
                                Text("Red Line")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text("East-West")
                                    .font(.caption)
                            }
                            .foregroundColor(selectedLine == 0 ? .white : .red)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(selectedLine == 0 ? Color.red : Color.red.opacity(0.1))
                        }
                        
                        Button(action: { selectedLine = 1 }) {
                            VStack(spacing: 6) {
                                Text("Blue Line")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text("North-South")
                                    .font(.caption)
                            }
                            .foregroundColor(selectedLine == 1 ? .white : .blue)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(selectedLine == 1 ? Color.blue : Color.blue.opacity(0.1))
                        }
                    }
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    
                    // Line Details
                    if selectedLine == 0 {
                        RedLineView()
                    } else {
                        BlueLineView()
                    }
                }
                
                Spacer(minLength: 30)
            }
        }
        .navigationTitle("Metro Information")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BlueLineView: View{
    var body: some View{
        VStack{
            Text("this is blue line")
        }
    }
}
struct RedLineView: View{
    var body: some View{
        VStack{
            Text("this is red line")
        }
    }
}



struct TabButton: View {
    let title: String
    let subtitle: String
    let isSelected: Bool
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.caption)
            }
            .foregroundColor(isSelected ? .white : color)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(isSelected ? color : color.opacity(0.1))
            .overlay(
                Rectangle()
                    .frame(height: isSelected ? 0 : 1)
                    .foregroundColor(color.opacity(0.3)),
                alignment: .bottom
            )
        }
    }
}


struct StatisticsRow: View {
    let corridor: String
    let length: String
    let structure: String
    let stations: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(corridor)
                .font(.headline)
                .fontWeight(.semibold)
            
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Length")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(length)
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 2) {
                    Text("Structure")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(structure)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 2) {
                    Text("Stations")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(stations)
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
            }
        }
        
        if corridor != "North-South (Blue)" {
            Divider()
        }
    }
}

#Preview {
    NavigationView {
        PatnaMetroInfoView()
    }
}
