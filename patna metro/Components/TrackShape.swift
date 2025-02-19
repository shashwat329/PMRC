//
//  TrackShape.swift
//  patna metro
//
//  Created by shashwat singh on 19/02/25.
//

import SwiftUI

struct TrackShape: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 5,height: 50)
            VStack{
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 50,height: 5)
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 50,height: 5)
                
            }
        }
    }
}

#Preview {
    TrackShape()
}
