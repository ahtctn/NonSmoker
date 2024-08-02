//
//  MainView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 28.07.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var timerManager: TimerManager
    @EnvironmentObject var mainViewModel: MainViewModel
    
    
    var body: some View {
        ZStack {
            ConstantColors.baseColor.ignoresSafeArea(.all)
            VStack(spacing: 0) {
                
                HeaderView {
                    print("Settings button tapped")
                    
                } knowAct: {
                    withAnimation(.smooth) {
                        mainViewModel.activePopup = .know
                    }
                }

                
                TimerView(timerManager: timerManager)
                Spacer()
                
                DefaultButtonView("I Smoked, Restart") {
                    mainViewModel.activePopup = .smokedRestart
                }
                .padding(.bottom, dynHeight * 0.05)
            }
            .onAppear {
                timerManager.startTimer()
            }
        }
    }
}


#Preview {
    MainView()
        .environmentObject(TimerManager())
        .environmentObject(MainViewModel())
}


