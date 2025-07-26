//
//  SearchableTextFieldView.swift
//  patna metro
//
//  Created by shashwat singh on 26/07/25.
//

import SwiftUI

struct SearchableTextFieldView: View {
    @State private var text: String = ""
    @State var placeholder: String
    @State private var showdropDown: Bool = false
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                    .fill(Color.gray)
                    .frame(maxWidth: .infinity,maxHeight: 55)
                TextField(placeholder, text: $text, onEditingChanged: { isEditing in
                    if isEditing {
                        showdropDown = true
                    }
                })
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    SearchableTextFieldView(placeholder: "enter your name")
}
