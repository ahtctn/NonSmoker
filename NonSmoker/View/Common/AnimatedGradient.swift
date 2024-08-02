//
//  AnimatedGradient.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 2.08.2024.
//

import SwiftUI

struct AnimatedGradient: View {
    @State private var gradientStart = UnitPoint(x: 0, y: -1)
    @State private var gradientEnd = UnitPoint(x: 1, y: 0)
    
    var colors: [Color]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: gradientStart, endPoint: gradientEnd)
            .onAppear {
                withAnimation(Animation.linear(duration: 8).repeatForever(autoreverses: true)) {
                    gradientStart = UnitPoint(x: 1, y: 1)
                    gradientEnd = UnitPoint(x: 0, y: 1)
                }
            }
    }
}

#Preview {
    AnimatedGradient(colors: [.orange, .red, .yellow])
}
