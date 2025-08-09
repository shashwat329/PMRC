//
//  SearchableTextFieldView.swift
//  patna metro
//
//  Created by shashwat singh on 26/07/25.
//

import SwiftUI

struct SearchableTextFieldView: View {
    @State private var text: String = ""
    @State private var showDropDown: Bool = false
    @FocusState private var isFocused: Bool
    var placeholder: String
    let allStation: [String] = [
        "Danapur Cantonment", "Saguna Mor", "RPS Mor", "Patliputra", "Rukanpura",
        "Raja Bazar", "Patna Zoo", "Vikas Bhawan", "Vidyut Bhawan", "Patna Junction",
        "CNLU","Mithapur", "Ramkrishna Nagar", "Jaganpur", "Khemni Chak", "Akashvani",
        "Gandhi Maidan", "PMCH", "Patna University", "Moin Ul Haq Stadium", "Rajendra Nagar",
        "Malahi Pakri", "Bhoothnath", "Zero Mile", "New ISBT"
    ]
    
    var filteredStation: [String] {
        if text.isEmpty { return [] }
        return allStation.filter { $0.localizedCaseInsensitiveContains(text) }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack{
                TextField(placeholder, text: $text)
                    .focused($isFocused)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).strokeBorder(Color.primaryColorTheme, lineWidth: 2))
                    .background(Color.gray.opacity(0.1))
                    .onChange(of: text) {
                        showDropDown = !filteredStation.isEmpty
                    }
                if !text.isEmpty{
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color.gray)
                    }

                }
            }

            if showDropDown {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        if filteredStation.isEmpty {
                            Text("No results found")
                                .foregroundColor(.red)
                                .padding()
                        } else {
                            ForEach(filteredStation, id: \.self) { station in
                                Text(station)
                                    .padding()
                                    .onTapGesture {
                                        text = station
                                        showDropDown = false
                                        isFocused = false
                                    }
                                Divider()
                            }
                        }
                    }
                }
                .frame(height:CGFloat(filteredStation.count) * 50)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.4)))
                .padding(.trailing,20)
            }
        }
        .padding()
        .onTapGesture {
            if !isFocused {
                showDropDown = false
            }
        }
    }
}

#Preview {
    SearchableTextFieldView(placeholder: "Enter Station Name")
}
