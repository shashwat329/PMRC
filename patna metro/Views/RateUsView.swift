//
//  RateUsView.swift
//  patna metro
//
//  Created by shashwat singh on 30/07/25.
//

import SwiftUI

struct RateUsView: View {
    let themeColor = Color(.primaryColorTheme)
    @State private var selectedRating: Int = 0
    @State private var feedbackText: String = ""
    @State private var showThankYou: Bool = false
    @State private var hasSubmitted: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                if showThankYou {
                    thankYouView
                } else {
                    ratingView
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
        .navigationTitle("Rate Our App")
        .navigationBarTitleDisplayMode(.inline)
        .animation(.easeInOut(duration: 0.5), value: showThankYou)
    }
    
    private var ratingView: some View {
        VStack(spacing: 30) {
            VStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(themeColor.opacity(0.1))
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "tram.fill")
                        .font(.system(size: 40))
                        .foregroundColor(themeColor)
                }
                
                Text("How was your experience?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Your feedback helps us improve the Patna Metro app and serve you better")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(2)
            }
            
            // Star Rating Section
            VStack(spacing: 16) {
                Text("Rate your experience")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                HStack(spacing: 8) {
                    ForEach(1...5, id: \.self) { star in
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedRating = star
                            }
                        }) {
                            Image(systemName: star <= selectedRating ? "star.fill" : "star")
                                .font(.system(size: 32))
                                .foregroundColor(star <= selectedRating ? .yellow : .gray.opacity(0.4))
                                .scaleEffect(star <= selectedRating ? 1.1 : 1.0)
                        }
                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: selectedRating)
                    }
                }
                
                if selectedRating > 0 {
                    Text(getRatingText(for: selectedRating))
                        .font(.subheadline)
                        .foregroundColor(themeColor)
                        .fontWeight(.medium)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
            
            // Feedback Section
            if selectedRating > 0 {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "bubble.left.fill")
                            .foregroundColor(themeColor)
                        Text("Tell us more (Optional)")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    
                    TextEditor(text: $feedbackText)
                        .frame(minHeight: 100)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(themeColor.opacity(0.3), lineWidth: 1)
                        )
                        .overlay(
                            Group {
                                if feedbackText.isEmpty {
                                    Text("Share your thoughts, suggestions, or report any issues...")
                                        .foregroundColor(.secondary)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 20)
                                        .allowsHitTesting(false)
                                }
                            },
                            alignment: .topLeading
                        )
                }
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
            
            // Quick Feedback Options
            if selectedRating > 0 && selectedRating < 4 {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(themeColor)
                        Text("What can we improve?")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 8) {
                        QuickFeedbackButton(text: "App Speed", icon: "speedometer")
                        QuickFeedbackButton(text: "User Interface", icon: "paintbrush.fill")
                        QuickFeedbackButton(text: "Real-time Data", icon: "clock.fill")
                        QuickFeedbackButton(text: "Navigation", icon: "map.fill")
                        QuickFeedbackButton(text: "Notifications", icon: "bell.fill")
                        QuickFeedbackButton(text: "Other", icon: "ellipsis.circle.fill")
                    }
                }
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
            
            // Action Buttons
            if selectedRating > 0 {
                VStack(spacing: 12) {
                    Button(action: submitRating) {
                        HStack {
                            Image(systemName: "paperplane.fill")
                            Text("Submit Rating")
                        }
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(themeColor)
                        .cornerRadius(12)
                    }
                    .disabled(hasSubmitted)
                    
                    if selectedRating >= 4 {
                        Button(action: openAppStore) {
                            HStack {
                                Image(systemName: "star.fill")
                                Text("Rate on App Store")
                            }
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(themeColor)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(themeColor.opacity(0.1))
                            .cornerRadius(12)
                        }
                    }
                }
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
            
            Spacer(minLength: 30)
        }
    }
    
    private var thankYouView: some View {
        VStack(spacing: 30) {
            Spacer()
            
            VStack(spacing: 20) {
                ZStack {
                    Circle()
                        .fill(themeColor.opacity(0.1))
                        .frame(width: 120, height: 120)
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(themeColor)
                }
                .scaleEffect(showThankYou ? 1.0 : 0.8)
                .animation(.spring(response: 0.6, dampingFraction: 0.7), value: showThankYou)
                
                VStack(spacing: 12) {
                    Text("Thank You!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(themeColor)
                    
                    Text("Your feedback has been submitted successfully")
                        .font(.title3)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    
                    Text("We appreciate your time and will use your feedback to make the Patna Metro app even better.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .lineSpacing(2)
                }
            }
            
            Spacer()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "house.fill")
                    Text("Back to App")
                }
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(themeColor)
                .cornerRadius(12)
            }
            
            Spacer(minLength: 50)
        }
    }
    
    private func getRatingText(for rating: Int) -> String {
        switch rating {
        case 1:
            return "Poor - We're sorry to hear that"
        case 2:
            return "Fair - We can do better"
        case 3:
            return "Good - Thanks for the feedback"
        case 4:
            return "Very Good - We're glad you like it!"
        case 5:
            return "Excellent - You're awesome!"
        default:
            return ""
        }
    }
    
    private func submitRating() {
        withAnimation(.easeInOut(duration: 0.5)) {
            hasSubmitted = true
        }
        
        // Simulate API call delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 0.7)) {
                showThankYou = true
            }
        }
        
        // Here you would implement actual rating submission logic
        // For example: send rating and feedback to your backend
    }
    
    private func openAppStore() {
        // Replace with your actual App Store URL
        if let url = URL(string: "https://apps.apple.com/app/your-app-id") {
            UIApplication.shared.open(url)
        }
    }
}

struct QuickFeedbackButton: View {
    let text: String
    let icon: String
    let themeColor = Color(hex: "1eacfa")
    @State private var isSelected = false
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                isSelected.toggle()
            }
        }) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.caption)
                Text(text)
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .foregroundColor(isSelected ? .white : themeColor)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isSelected ? themeColor : themeColor.opacity(0.1))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(themeColor.opacity(0.3), lineWidth: isSelected ? 0 : 1)
            )
        }
    }
}


// Preview
#Preview{
    NavigationView {
        RateUsView()
    }
}
