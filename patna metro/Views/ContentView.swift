//
//  ContentView.swift
//  patna metro
//
//  Created by shashwat singh on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView(){
                HomeView()
                    .tabItem{
                        Label("Home",systemImage:"house.fill")
                    }
                
                TransactionView()
                    .tabItem{
                        Label("top up",systemImage: "indianrupeesign.square.fill")
                    }
                
                ContactSupportView()
                
                    .tabItem{
                        Label("Support", systemImage: "questionmark.app.fill")
                    }
                AccountView()
                    .tabItem{
                        Label("Account",systemImage: "person.fill")
                    }
            }
            .accentColor(Color(hex: "#1eacfa"))
        }
    }
}

#Preview {
    ContentView()
}
