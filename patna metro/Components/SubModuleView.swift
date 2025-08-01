//
//  SubModuleView.swift
//  patna metro
//
//  Created by shashwat singh on 30/07/25.
//

import SwiftUI

struct SubModuleView: View {
    var image: String
    let moduleID: Int
    var text: String
    var height: CGFloat?
    var width: CGFloat?
    var body: some View {
        NavigationLink(destination: destinationView) {
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: width ?? 50,height: height ?? 50)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 20,x: 0,y: 1)
            
        }
    }
    @ViewBuilder
    private var destinationView: some View {
        switch moduleID {
            case 4:
                MetroNavigationView()
            case 5:
                RateUsView()
            case 6:
                AboutUsView()
            case 7:
                DisclaimerView()
            case 8:
                PatnaMetroInfoView()
            case 9:
                ContactUsView()
            case 10:
                EmptyView()
            default:
                Text("Unknown View")
        }
    }

}

#Preview {
    SubModuleView(image: "info", moduleID: 5, text: "information")
}
