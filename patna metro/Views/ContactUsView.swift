//
//  ContactUsView.swift
//  patna metro
//
//  Created by shashwat singh on 30/07/25.
//

import SwiftUI

struct ContactUsView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var subject = ""
    @State private var message = ""
    @State private var isSubmitted = false
    
    let themeColor = Color(hex: "1eacfa")

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    CustomTextField(title: "Full Name", text: $name)
                    CustomTextField(title: "Email Address", text: $email, keyboardType: .emailAddress)
                    CustomTextField(title: "Subject", text: $subject)
                    CustomTextEditor(title: "Your Message", text: $message)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                .shadow(radius: 4)
                .padding(.horizontal)

                Button(action: {
                    withAnimation {
                        isSubmitted = true
                    }
                    // TODO: Handle form submission
                }) {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(themeColor)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }

                if isSubmitted {
                    Text("Thank you for contacting us!")
                        .foregroundColor(.green)
                        .transition(.opacity)
                }

                Divider()
                    .padding(.top, 30)

                // Social / Web Contact Links
                VStack(spacing: 12) {
                    Text("Or reach out to me here:")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    HStack(spacing: 24) {
                        Link(destination: URL(string: "https://instagram.com/your_instagram_username")!) {
                            Label("Instagram", systemImage: "camera")
                                .foregroundColor(themeColor)
                        }

                        Link(destination: URL(string: "https://shashwatt.in")!) {
                            Label("shashwatt.in", systemImage: "globe")
                                .foregroundColor(themeColor)
                        }
                    }
                    .font(.subheadline)
                }

                Spacer(minLength: 40)
            }
        }
        .navigationTitle("Contact Us")
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(.keyboard)
    }
}

struct CustomTextEditor: View {
    var title: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            TextEditor(text: $text)
                .frame(minHeight: 100)
                .padding(8)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
        }
    }
}

#Preview {
    NavigationStack{
        ContactUsView()
    }
}
