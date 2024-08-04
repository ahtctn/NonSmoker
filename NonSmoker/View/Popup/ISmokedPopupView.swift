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
            RoundedRectangle(cornerRadius: 4)
                .stroke(.black, lineWidth: 10)
                .frame(width: dynWidth * 0.89, height: dynWidth * 0.79)
            
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.white)
                .frame(width: dynWidth * 0.89, height: dynWidth * 0.79)
                .overlay(
                    VStack(spacing: 11) {
                        Spacer()
                        Text(motivationalTitle)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 25)).bold()
                            .foregroundStyle(.black)
                            .padding([.leading, .trailing], 20)
                        LottieAnimationViewHelper(name: "restartSmoking", loopMode: .loop)
                            .frame(width: dynWidth * 0.25, height: dynWidth * 0.25)
                            .scaledToFit()
                        Text(motivationalQuote)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.black)
                            .font(.system(size: 18)).bold()
                            .padding([.leading, .trailing], 20)
                        Spacer()
                        Button {
                            action()
                        } label: {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(ConstantColors.rectangleLinearColor)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.black, lineWidth: 6)
                                        .overlay {
                                            Text("Restart The Challenge")
                                                .foregroundStyle(.black)
                                                .font(.system(size: 15)).bold()
                                        }
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
