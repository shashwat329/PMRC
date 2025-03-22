//
//  FeedbackFormView.swift
//  patna metro
//
//  Created by shashwat singh on 26/01/25.
//

import SwiftUI

struct ContactSupportView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var supportMsg: String = ""

    @State private var showAlert: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("How we can help?")) {
                TextField("Name", text: $name)
                    .textInputAutocapitalization(.words)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
            }
            Section(header: Text("Enter Your message")) {
                TextEditor(text: $supportMsg)
                    .frame(height: 150)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
            Button(action: submitFeedback) {
                Text("Submit Feedback")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Thank You!"),
                    message: Text("Your feedback has been submitted."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
            .navigationTitle("Contact & Support")
    }
    
    func submitFeedback() { 
        showAlert = true
        clearForm()
    }
    
    func clearForm() {
        name = ""
        email = ""
        supportMsg = ""
    }
}


#Preview {
        ContactSupportView()
        
}
