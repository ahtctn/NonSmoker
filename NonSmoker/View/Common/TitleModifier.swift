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
            .font(.system(size: 33))
            .foregroundStyle(color)
            .padding(.all, dynWidth * 0.03)
        
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.black, lineWidth: 3)
            }
            
    }
}

extension View {
    func titleModifier(_ color: Color) -> some View {
        self.modifier(TitleModifier(color: color))
    }
}

