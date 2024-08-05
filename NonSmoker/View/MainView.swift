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
    @State private var perc1: Double = 25
    @State private var perc2: Double = 62
    @State private var perc3: Double = 81
    
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
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        Spacer()
                        MainHealthSectionView(perc: $perc)
                        Spacer()
                        MainHealthSectionView(perc: $perc1)
                        Spacer()
                        
                    }
                    
                    HStack(spacing: 20) {
                        Spacer()
                        MainHealthSectionView(perc: $perc2)
                        Spacer()
                        MainHealthSectionView(perc: $perc3)
                        Spacer()
                        
                    }
                }
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


