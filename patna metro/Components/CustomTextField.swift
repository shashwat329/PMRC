//
//  CustomTextField.swift
//  patna metro
//
//  Created by shashwat singh on 31/07/25.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
            TextField(title, text: $text)
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).strokeBorder(Color.primaryColorTheme, lineWidth: 2))
                .background(Color.gray.opacity(0.1))
        }
    }
}

#Preview {
    CustomTextField(title: "Name", text: .constant(""))
}
