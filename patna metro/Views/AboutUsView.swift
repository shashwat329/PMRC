//
//  AboutUsView.swift
//  patna metro
//
//  Created by shashwat singh on 30/07/25.
//

import SwiftUI

struct AboutUsView: View {
    let themeColor = Color(hex: "1eacfa")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header Section
                VStack(spacing: 16) {
                    Image(systemName: "tram.fill")
                        .font(.system(size: 60))
                        .foregroundColor(themeColor)
                    
                    Text("Patna Metro")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Your Smart Transit Companion")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                
                // Mission Section
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "target")
                            .foregroundColor(themeColor)
                            .font(.title2)
                        Text("Our Mission")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    Text("We built this application to revolutionize public transportation in Patna by providing real-time metro information, route planning, and seamless navigation. Our goal is to make metro travel more accessible, efficient, and user-friendly for all passengers.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineSpacing(4)
                }
                .padding(.horizontal, 20)
                
                // Why We Built This Section
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(themeColor)
                            .font(.title2)
                        Text("Why We Built This")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        FeatureRow(icon: "clock.fill", text: "Provide real-time metro schedules and delays")
                        FeatureRow(icon: "map.fill", text: "Offer intuitive route planning and navigation")
                        FeatureRow(icon: "person.3.fill", text: "Enhance the daily commute experience")
                        FeatureRow(icon: "leaf.fill", text: "Promote sustainable urban transportation")
                        FeatureRow(icon: "smartphone", text: "Digitize metro services for modern users")
                    }
                }
                .padding(.horizontal, 20)
                
                // Team Section
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image(systemName: "person.3.fill")
                            .foregroundColor(themeColor)
                            .font(.title2)
                        Text("Meet Our Team")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal, 20)
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16) {
                        TeamMemberCard(
                            name: "Your Name",
                            role: "Lead Developer",
                            description: "Full-stack developer passionate about public transportation technology"
                        )
                        
                        TeamMemberCard(
                            name: "Team Member 2",
                            role: "UI/UX Designer",
                            description: "Designer focused on creating intuitive user experiences"
                        )
                        
                        TeamMemberCard(
                            name: "Team Member 3",
                            role: "Backend Developer",
                            description: "Specialist in real-time data systems and API development"
                        )
                        
                        TeamMemberCard(
                            name: "Team Member 4",
                            role: "Data Analyst",
                            description: "Expert in transportation data and route optimization"
                        )
                    }
                    .padding(.horizontal, 20)
                }
                
                // Features Section
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(themeColor)
                            .font(.title2)
                        Text("Key Features")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    VStack(spacing: 12) {
                        FeatureCard(
                            icon: "clock.badge.checkmark",
                            title: "Real-Time Updates",
                            description: "Get live metro timings and platform information"
                        )
                        
                        FeatureCard(
                            icon: "map.circle",
                            title: "Route Planning",
                            description: "Find the fastest route to your destination"
                        )
                        
                        FeatureCard(
                            icon: "creditcard.fill",
                            title: "Digital Payments",
                            description: "Purchase tickets and recharge cards digitally"
                        )
                        
                        FeatureCard(
                            icon: "bell.badge",
                            title: "Smart Notifications",
                            description: "Receive alerts about delays and service updates"
                        )
                    }
                }
                .padding(.horizontal, 20)
                
                // Contact Section
                VStack(spacing: 12) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(themeColor)
                            .font(.title2)
                        Text("Get in Touch")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    Text("Have feedback or suggestions? We'd love to hear from you!")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        // Add contact action
                    }) {
                        HStack {
                            Image(systemName: "mail.fill")
                            Text("Contact Us")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(themeColor)
                        .cornerRadius(25)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
        .navigationTitle("About Us")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TeamMemberCard: View {
    let name: String
    let role: String
    let description: String
    let themeColor = Color(hex: "1eacfa")
    
    var body: some View {
        VStack(spacing: 8) {
            Circle()
                .fill(themeColor.opacity(0.1))
                .frame(width: 60, height: 60)
                .overlay(
                    Image(systemName: "person.fill")
                        .font(.title2)
                        .foregroundColor(themeColor)
                )
            
            Text(name)
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Text(role)
                .font(.subheadline)
                .foregroundColor(themeColor)
                .fontWeight(.medium)
            
            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(3)
        }
        .padding(16)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct FeatureRow: View {
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

struct FeatureCard: View {
    let icon: String
    let title: String
    let description: String
    let themeColor = Color(hex: "1eacfa")
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(themeColor)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
        }
        .padding(16)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}


// Preview

#Preview {
    NavigationView {
        AboutUsView()
    }
}
