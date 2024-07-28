//
//  LottieAnimationViewHelper.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 28.07.2024.
//

import Foundation
import Lottie
import SwiftUI
import UIKit

struct LottieAnimationViewHelper: UIViewRepresentable {
    typealias UIViewType = UIView
    
    let name: String
    let loopMode: LottieLoopMode
    var speed: CGFloat?
    
    func makeUIView(context: UIViewRepresentableContext<LottieAnimationViewHelper>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView(name: name)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = loopMode
        animationView.animationSpeed = speed ?? 1.0
        animationView.play()
        
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieAnimationViewHelper>) {
        
    }
}

