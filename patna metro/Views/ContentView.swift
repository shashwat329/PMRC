//
//  ContentView.swift
//  patna metro
//
//  Created by shashwat singh on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            Color("BgColor")
            NavigationStack {
                VStack {
                    TabView(selection: $selectedTab) {
                        HomeView()
                            .tabItem {
                                Label("Home", systemImage: "house.fill")
                            }
                            .tag(0)
                        
                        TransactionView()
                            .tabItem {
                                Label("Top Up", systemImage: "indianrupeesign.square.fill")
                            }
                            .tag(1)
                        
                        ContactSupportView()
                            .tabItem {
                                Label("Support", systemImage: "questionmark.app.fill")
                            }
                            .tag(2)
                        
                        AccountView()
                            .tabItem {
                                Label("Account", systemImage: "person.fill")
                            }
                            .tag(3)
                    }
                    .accentColor(Color(hex: "#1eacfa"))
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text(getTitle(for: selectedTab)) // Dynamic Title
                                .font(.headline)
                        }
                    }
                }
               
            }
        }
    }
    
    func getTitle(for tab: Int) -> String {
        switch tab {
        case 0: return "Patna metro"
        case 1: return "Ticket"
        case 2: return "Contact & Support"
        case 3: return "Account"
        default: return ""
        }
    }
}

#Preview {
    
    ContentView()
}
