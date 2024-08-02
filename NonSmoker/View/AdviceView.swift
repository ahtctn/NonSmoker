//
//  AdviceView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 2.08.2024.
//

import SwiftUI

struct AdviceView: View {
    @StateObject private var vm = AdviceViewModel()
    @EnvironmentObject var mainVM: MainViewModel
    var body: some View {
        ZStack {
            AnimatedGradient(colors: [Color.red, Color.orange, Color.yellow]).ignoresSafeArea(.all)
            VStack {
                Spacer()
                
                VStack(spacing: 15) {
                    Spacer()
                    LottieAnimationViewHelper(name: "doctor", loopMode: .loop)
                        .frame(width: dynWidth * 0.4, height: dynWidth * 0.4)
                    Spacer()
                    if let advice = vm.randomAdvice {
                        let title = advice.title
                        let subtitle = advice.subtitle
                        
                        VStack(alignment: .leading, spacing: 30) {
                            Text(title)
                                .titleModifier(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(
                                            ConstantColors.rectangleLinearColor
                                        )
                                )
                            
                            Text(subtitle)
                                .subtitleModifier()
                            
                        }
                        .padding([.leading, .trailing], dynWidth * 0.0426)
                        .foregroundStyle(.white)
                        
                    }
                    Spacer()
                }
                
                Spacer()
                DefaultButtonView("Get Advice") {
                    vm.fetchNewAdvice()
                }
            }
            
            XMarkView {
                mainVM.activePopup = nil
            }
           
            
           
        }
        
        
    }
}

#Preview {
    AdviceView()
        .environmentObject(MainViewModel())
}
