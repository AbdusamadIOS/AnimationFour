//
//  PetalView.swift
//  AnimationFour
//
//  Created by Abdusamad Mamasoliyev on 24/05/24.
//

import SwiftUI

struct PetalView: View {
    
    @Binding var petal: Bool
    var degress: Double = 0.0
    
    var body: some View {
        Image("petal")
            .resizable()
            .frame(width: 75, height: 125)
            .rotationEffect(.degrees(petal ? degress : degress), anchor: .bottom)
            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: petal)
    }
}

#Preview {
    PetalView(petal: .constant(true))
}
