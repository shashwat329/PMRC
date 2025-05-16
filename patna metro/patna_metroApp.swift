//
//  patna_metroApp.swift
//  patna metro
//
//  Created by shashwat singh on 10/12/24.
//

import SwiftUI

@main
struct patna_metroApp: App {
    @State var isactive: Bool = true
    var body: some Scene {
        WindowGroup {
            if isactive{
                animatedLaunchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.isactive = false
                        }
                    }
            }
            else{
                ContentView()
            }
        }
    }
}
