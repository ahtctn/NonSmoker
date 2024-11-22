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
    let anims = ["adviceAnim1", "adviceAnim2", "adviceAnim3", "adviceAnim4"]

    var body: some View {
        ZStack {
            AnimatedGradient(colors: [Color.red, Color.orange, Color.yellow]).ignoresSafeArea(.all)
            VStack {
                Spacer()
                AdviceHeaderView(text: "Advice")
                VStack(spacing: 15) {
                    Spacer()
                    LottieAnimationViewHelper(name: anims.randomElement()!, loopMode: .loop)
                        .frame(width: dynWidth * 0.6, height: dynWidth * 0.6)
                    //Spacer().frame(height: dynWidth * 0.08)
                    if let advice = vm.randomAdvice {
                        let title = advice.title
                        let subtitle = advice.subtitle
                        
                        VStack(alignment: .leading, spacing: 10) {
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
                        .padding([.leading, .trailing], dynWidth * 0.1)
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


