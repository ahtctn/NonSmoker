//
//  ISmokedPopupView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 28.07.2024.
//

import SwiftUI

struct ISmokedPopupView: View {
    @StateObject private var iSmokedPopupViewModel = ISmokedPopupViewModel()
    @State private var motivationalTitle: String = ""
    @State private var motivationalQuote: String = ""
    var action: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .stroke(ConstantColors.rectangleLinearColor, lineWidth: 4)
                .frame(width: dynWidth * 0.89, height: dynWidth * 0.79)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.black)
                .frame(width: dynWidth * 0.89, height: dynWidth * 0.79)
                .overlay(
                    VStack(spacing: 11) {
                        Spacer()
                        Text(motivationalTitle)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 22)).bold()
                            .foregroundStyle(.white)
                            .padding([.leading, .trailing], 20)
                        LottieAnimationViewHelper(name: "deathnotpro", loopMode: .loop)
                            .frame(width: dynWidth * 0.3, height: dynWidth * 0.3)
                            .scaledToFit()
                        Text(motivationalQuote)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white.opacity(0.8))
                            .font(.system(size: 12))
                            .padding([.leading, .trailing], 20)
                        Spacer()
                        Button {
                            action()
                        } label: {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(ConstantColors.rectangleLinearColor)
                                .overlay {
                                    Text("Restart The Challenge")
                                        .foregroundStyle(.white)
                                        .font(FontHandler.makeFont(.sansSemiBold14))
                                }
                                .frame(width: dynWidth * 0.8, height: dynHeight * 0.0591)
                        }
                        Spacer()
                    }
                )
        }
        .onAppear {
            motivationalTitle = iSmokedPopupViewModel.getRandomMotivationalTitle()
            motivationalQuote = iSmokedPopupViewModel.getRandomMotivationalQuote()
        }
    }
}

#Preview {
    ISmokedPopupView(action: {})
}
