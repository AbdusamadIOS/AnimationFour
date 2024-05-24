//
//  SnowView.swift
//  AnimationFour
//
//  Created by Abdusamad Mamasoliyev on 24/05/24.
//

import SwiftUI

struct SnowView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let screen = UIScreen.main.bounds
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screen.width, height: screen.height))
        view.layer.masksToBounds = true
        
        let emitter = CAEmitterLayer()
        emitter.frame = CGRect(x: 200, y: -100, width: view.frame.width, height: view.frame.height)
        
        let cell = CAEmitterCell()
        cell.birthRate = 40
        cell.lifetime = 25
        cell.velocity = 60
        cell.scale = 0.025
        cell.emissionRange = CGFloat.pi
        cell.contents = UIImage(named: "snow")?.cgImage
        
        emitter.emitterCells = [cell]
        view.layer.addSublayer(emitter)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

#Preview {
    SnowView().background(Color.black)
}
