//
//  AccountView.swift
//  patna metro
//
//  Created by shashwat singh on 10/12/24.
//

import SwiftUI

struct AccountView: View {
    @State private var name: String = "Kamya Kushwaha"
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
                .frame(width: 350,height: 250)
                .overlay{
                    VStack{
                        Text("Kumar shashwat".capitalized)
                            .font(.headline)
                            .foregroundColor(Color.white)
                        Text("XXXXXXXXXXX")
                            .font(.largeTitle)
                    }
                    
                }
                .padding()
            Text("Name: \(name)")
            Text("Email: \(name)@gmail.com")
            Spacer()
        }
    }
}

#Preview {
    AccountView()
}
