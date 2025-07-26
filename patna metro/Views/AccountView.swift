//
//  AccountView.swift
//  patna metro
//
//  Created by shashwat singh on 10/12/24.
//

import SwiftUI

struct AccountView: View {
    @State private var name: String = "Kumar Shashwat"
    private var cardnumber: String = "12133224224";
    @State private var showToast = false
    var body: some View {
        ZStack {
            Color("BgColor")
                .ignoresSafeArea(.all)
            VStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: "#1eacfa"))
                    .frame(width: 350,height: 216)
                    .overlay{
                        VStack{
                            Text("Kumar shashwat".capitalized)
                                .font(.headline)
                                .foregroundColor(Color.white)
                            HStack{
                                Text("\(cardnumber)")
                                    .font(.largeTitle)
                                    .padding(.leading,20)
                                Button {
                                    UIPasteboard.general.string = cardnumber
                                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                    withAnimation {
                                        showToast = true
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation {
                                            showToast = false
                                        }
                                    }
                                    
                                    
                                } label: {
                                    Image(systemName: "clipboard")
                                        .padding()
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                                
                            }
                            if showToast {
                                Text("Copied to clipboard!")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.blue.opacity(0.8))
                                    .cornerRadius(10)
                                    .transition(.move(edge: .bottom).combined(with: .opacity))
                            }
                            
                        }
                    }
                VStack(alignment: .leading){
                    Text("Name: \(name)")
                    Text("Email: \(name)@gmail.com")
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    AccountView()
}
