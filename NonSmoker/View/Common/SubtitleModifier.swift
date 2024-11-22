//
//  SubtitleModifier.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 2.08.2024.
//

import SwiftUI

struct SubtitleModifier: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .font(.system(size: 16))
            .foregroundStyle(color)
            .multilineTextAlignment(.leading)
            .padding(.all, dynWidth * 0.08)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(color, lineWidth: 5)
            }
    }
}

extension View {
    func subtitleModifier(_ color: Color) -> some View {
        self.modifier(SubtitleModifier(color: color))
    }
}
