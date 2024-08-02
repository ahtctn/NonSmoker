//
//  SubtitleModifier.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 2.08.2024.
//

import SwiftUI

struct SubtitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .font(.system(size: 16))
            .foregroundStyle(.white)
            .multilineTextAlignment(.leading)
    }
}

extension View {
    func subtitleModifier() -> some View {
        self.modifier(SubtitleModifier())
    }
}
