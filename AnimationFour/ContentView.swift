//
//  ContentView.swift
//  AnimationFour
//
//  Created by Abdusamad Mamasoliyev on 23/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var petal = false
    @State private var breathInLabel = true
    @State private var breathOutLabel = false
    @State private var offsetBreath = false
    @State private var diffuseBreath = false
    @State private var breathTheBouquet = false
    
    var body: some View {
        ZStack {
         Image("winterNight")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 400, height: 900)
            SnowView()
            ZStack {
                Group {
                    Text("iDevFan")
                        .font(Font.custom("papyrus", size: 35))
                        .foregroundColor(.white)
                        .opacity(breathInLabel ? 0 : 1)
                        .scaleEffect(breathInLabel ? 0 : 1)
                        .offset(y: -160)
                        .animation(Animation.easeOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathInLabel)
                    
                    Text("iDevFan LLC")
                        .font(Font.custom("papyrus", size: 35))
                        .foregroundColor(.green)
                        .opacity(breathOutLabel ? 0 : 1)
                        .scaleEffect(breathOutLabel ? 0 : 1)
                        .offset(y: -160)
                        .animation(Animation.easeOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathOutLabel)
                }
                Group {
                    Image("smoke")
                        .resizable()
                        .frame(width: 35, height: 125)
                        .offset(y: offsetBreath ? 90 : 0)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: offsetBreath)
                        .blur(radius: diffuseBreath ? 1 : 60)
                        .offset(x: 0, y: diffuseBreath ? -50 : -100)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: diffuseBreath)
                }.shadow(radius: diffuseBreath ? 20 : 0)
                
                Group {
                    PetalView(petal: $petal, degress: petal ? -25 : -5)
                    Image("petal")
                        .resizable()
                        .frame(width: 75, height: 125)
                    PetalView(petal: $petal, degress: petal ? 25 : 5)
                    PetalView(petal: $petal, degress: petal ? -50 : -10)
                    PetalView(petal: $petal, degress: petal ? 50 : 10)
                }
                
                Group {
                    Image("bouquet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 400)
                        .rotationEffect(.degrees(37))
                        .offset(x: -25, y: 90)
                        .scaleEffect(breathTheBouquet ? 1.04 : 1, anchor: .center)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathTheBouquet)
                    
                    Image("bouquet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 400)
                        .rotationEffect(.degrees(37))
                        .offset(x: -20, y: 95)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .scaleEffect(breathTheBouquet ? 1.04 : 1, anchor: .center)
                        .hueRotation(Angle(degrees: breathTheBouquet ? -50 : 300))
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathTheBouquet)
                }
            }
        }
        .onAppear() {
            breathInLabel.toggle()
            breathOutLabel.toggle()
            offsetBreath.toggle()
            diffuseBreath.toggle()
            petal.toggle()
            breathTheBouquet.toggle()
        }
    }
}

#Preview {
    ContentView()
}
