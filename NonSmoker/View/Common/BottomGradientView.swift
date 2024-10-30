//
//  BottomGradientView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 30.10.2024.
//

import SwiftUI

struct BottomGradientView: View {
    var body: some View {
        bottomGradient
    }
    
    private var bottomGradient: some View {
        VStack {
            Spacer()
            ConstantColors.blackToClearLinearColor.frame(height: dynHeight * 0.2)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    BottomGradientView()
}
