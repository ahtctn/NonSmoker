//
//  AdviceView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 2.08.2024.
//

import SwiftUI

struct AdviceView: View {
    @EnvironmentObject private var vm: AdviceViewModel
    @EnvironmentObject var mainVM: MainViewModel
    

    var body: some View {
        ZStack {
            AnimatedGradient(colors: [Color.red, Color.orange, Color.yellow]).ignoresSafeArea(.all)
            VStack {
                Spacer()
                
                VStack(spacing: 15) {
                    Spacer()
                    LottieAnimationViewHelper(name: "doctor", loopMode: .loop)
                        .frame(width: dynWidth * 0.6, height: dynWidth * 0.6)
                    Spacer()
                    if let advice = vm.randomAdvice {
                        let title = advice.title
                        let subtitle = advice.subtitle
                        
                        VStack(alignment: .leading, spacing: 30) {
                            Text(title)
                                .titleModifier(.black)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.white)
                                )
                            
                            Text(subtitle)
                                .subtitleModifier(.black)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.white)
                                )
                            
                        }
                        .padding([.leading, .trailing], dynWidth * 0.0426)
                        .foregroundStyle(.white)
                        
                    }
                    Spacer()
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
        .environmentObject(AdviceViewModel())
}
