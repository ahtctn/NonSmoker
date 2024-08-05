//
//  BottomSheetModifier.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 5.08.2024.
//

import SwiftUI

struct BottomSheetModifier: ViewModifier {
    
    let height: CGFloat
    let opacity: CGFloat
    
    init(_ height: CGFloat,
         opa opacity: CGFloat = 0.9) {
        self.height = height
        self.opacity = opacity
    }
    
    func body(content: Content) -> some View {
        content
            .presentationDetents([.fraction(height)])
            .presentationCornerRadius(32)
            .presentationBackgroundInteraction(.enabled)
            .presentationBackground(Color("base2").opacity(opacity))
    }
}
