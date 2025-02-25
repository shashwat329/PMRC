//
//  TransitionView.swift
//  patna metro
//
//  Created by shashwat singh on 10/12/24.
//

import SwiftUI

struct TransactionView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.blue)
                .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    TransactionView()
}
