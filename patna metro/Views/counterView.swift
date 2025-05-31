//
//  counterView.swift
//  patna metro
//
//  Created by shashwat singh on 30/05/25.
//

import SwiftUI

struct MainView: View {
    let arr = ["a", "b", "c"]
    
    var body: some View {
        VStack {
            ForEach(Array(arr.enumerated()), id: \.element) { index, item in
                HStack {
                    counterView(count: index + 1)
                    Text(item)
                        .font(.largeTitle)
                        .foregroundStyle(Color.gray)
                }
            }
        }
    }
}

struct counterView: View {
    var count: Int
    
    var body: some View {
        Text("\(count)")
            .font(.title)
            .padding()
            .background(Color.blue)
            .foregroundStyle(.white)
            .cornerRadius(10)
    }
}

#Preview {
    MainView()
}

