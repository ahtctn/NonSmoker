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
    
    @State private var perc: Double = 11
    
    var body: some View {
        ZStack {
            Color.baseClr.ignoresSafeArea(.all)
            VStack {
                HeaderView {
                    withAnimation(.smooth) {
                        mainViewModel.activePopup = .know
                    }
                } settingsAct: {
                    withAnimation(.smooth) {
                        mainViewModel.activeSheet = .settings
                    }
                }

                TimerView(timerManager: timerManager)
                MainHealthSectionView(perc: $timerManager.progressPercentage)
                Spacer()
                
            }
            .onAppear {
                timerManager.startTimer()
            }
            BottomGradientView()
        }
    }
}

extension View {
    private var bottomGradient: some View {
        VStack {
            Spacer()
            ConstantColors.blackToClearLinearColor.frame(height: dynWidth * 0.3)
        }
        .ignoresSafeArea(.all)
    }
}


#Preview {
    MainView()
        .environmentObject(TimerManager())
        .environmentObject(MainViewModel())
}


