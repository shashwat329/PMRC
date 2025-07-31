//
//  DisclamierView.swift
//  patna metro
//
//  Created by shashwat singh on 30/07/25.
//

import SwiftUI

struct DisclaimerView: View {
    let themeColor = Color(hex: "1eacfa")
    @Environment(\.presentationMode) var presentationMode
    @State private var hasAccepted = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header Section
                VStack(spacing: 16) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.orange)
                    
                    Text("Important Disclaimer")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text("Please read this carefully before using our app")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                
                // Main Disclaimer Content
                VStack(spacing: 20) {
                    DisclaimerCard(
                        icon: "building.2.fill",
                        title: "Unofficial Application",
                        content: "This application is NOT an official app of Patna Metro Rail Corporation (PMRC). We are an independent development team creating this app to help commuters with metro information and services."
                    )
                    
                    DisclaimerCard(
                        icon: "chart.line.uptrend.xyaxis",
                        title: "Data Accuracy",
                        content: "While we strive to provide the most accurate and up-to-date information, there may be differences between the data shown in our app and the actual metro services. Real-time information may vary due to technical limitations or data source delays."
                    )
                    
                    DisclaimerCard(
                        icon: "clock.arrow.circlepath",
                        title: "Our Commitment",
                        content: "We are committed to providing you with the best possible information at the earliest. Our team works continuously to improve data accuracy and update information as quickly as possible."
                    )
                    
                    DisclaimerCard(
                        icon: "person.2.fill",
                        title: "User Responsibility",
                        content: "Users are advised to cross-verify critical information such as train timings, route changes, and service availability with official PMRC sources, especially for important journeys."
                    )
                    
                    DisclaimerCard(
                        icon: "shield.lefthalf.filled",
                        title: "Limitation of Liability",
                        content: "We shall not be held responsible for any inconvenience, delay, or loss caused due to reliance on the information provided in this application. Use this app as a helpful tool, not as the sole source of metro information."
                    )
                }
                .padding(.horizontal, 20)
                
                // Official Sources Section
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(themeColor)
                            .font(.title2)
                        Text("Official Sources")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    Text("For official and verified information, please refer to:")
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        OfficialSourceRow(icon: "globe", text: "PMRC Official Website")
                        OfficialSourceRow(icon: "phone.fill", text: "PMRC Customer Care")
                        OfficialSourceRow(icon: "building.2", text: "Metro Station Information Boards")
                        OfficialSourceRow(icon: "speaker.wave.2.fill", text: "Station Announcements")
                    }
                }
                .padding(.horizontal, 20)
                
                // Terms and Conditions
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "doc.text.fill")
                            .foregroundColor(themeColor)
                            .font(.title2)
                        Text("Terms of Use")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("• By using this app, you acknowledge that this is an unofficial application")
                        Text("• You understand that data accuracy may vary and should be verified")
                        Text("• You agree to use this app at your own discretion and risk")
                        Text("• We reserve the right to modify or discontinue the service")
                        Text("• Your privacy and data will be handled according to our privacy policy")
                    }
                    .font(.body)
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal, 20)
                
                // Acknowledgment Section
                VStack(spacing: 16) {
                    HStack {
                        Button(action: {
                            hasAccepted.toggle()
                        }) {
                            Image(systemName: hasAccepted ? "checkmark.square.fill" : "square")
                                .font(.title2)
                                .foregroundColor(hasAccepted ? themeColor : .gray)
                        }
                        
                        Text("I have read and understand the disclaimer")
                            .font(.body)
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    Button(action: {
                        // Handle acceptance and dismiss
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "hand.thumbsup.fill")
                            Text("I Understand & Continue")
                        }
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(hasAccepted ? themeColor : Color.gray)
                        .cornerRadius(12)
                    }
                    .disabled(!hasAccepted)
                    .padding(.horizontal, 20)
                    
                    Text("Thank you for understanding and using our app responsibly")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 30)
            }
        }
        .navigationTitle("Disclaimer")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DisclaimerCard: View {
    let icon: String
    let title: String
    let content: String
    let themeColor = Color(hex: "1eacfa")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(themeColor)
                    .frame(width: 30)
                
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
                .lineSpacing(3)
        }
        .padding(16)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(themeColor.opacity(0.2), lineWidth: 1)
        )
    }
}

struct OfficialSourceRow: View {
    let icon: String
    let text: String
    let themeColor = Color(hex: "1eacfa")
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(themeColor)
                .font(.body)
                .frame(width: 20)
            
            Text(text)
                .font(.body)
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}



#Preview {
    DisclaimerView()
}
