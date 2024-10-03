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
                VStack(spacing: 20) {
                    HStack(spacing: 10) {
                        Spacer()
                        MainHealthSectionView(perc: $perc)
                        Spacer()
                        MainHealthSectionView(perc: $perc1)
                        Spacer()
                    }
                    
                    HStack(spacing: 10) {
                        Spacer()
                        MainHealthSectionView(perc: $perc2)
                        Spacer()
                        MainHealthSectionView(perc: $perc3)
                        Spacer()
                        
                    }
                }
                Spacer()
                
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


