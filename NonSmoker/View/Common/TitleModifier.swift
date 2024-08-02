//
//  TitleModifier.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 2.08.2024.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.system(size: 25))
            .foregroundStyle(color)
            .padding(.all, dynWidth * 0.013)
        
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.mint, lineWidth: 3)
            }
            
    }
}

extension View {
    func titleModifier(_ color: Color) -> some View {
        self.modifier(TitleModifier(color: color))
    }
}

