//
//  AccountView.swift
//  patna metro
//
//  Created by shashwat singh on 10/12/24.
//

import SwiftUI

struct AccountView: View {
    @State private var name: String = "Kumar Shashwat"
    private var cardNumber: String = "1213 3224 2242"
    @State private var showToast = false

    var body: some View {
        ZStack(alignment: .top) {
            Color("BgColor")
                .ignoresSafeArea()
            ScrollView{
                VStack() {
                    MetroCardView()
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.blue)
                            Text("Name:")
                                .fontWeight(.semibold)
                            Text(name)
                        }
                        
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.blue)
                            Text("Email:")
                                .fontWeight(.semibold)
                            Text("\(name.lowercased().replacingOccurrences(of: " ", with: ""))@gmail.com")
                        }
                    }
                    .font(.body)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.top, 60)
            }
            .navigationTitle("Account")
        }
    }
}



#Preview {
//    MetroCardView()
    NavigationStack{
        AccountView()
    }
    
}
