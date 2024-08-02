//
//  HomeDelegate.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 27.07.2024.
//

import SwiftUI
import AVFoundation

struct HomeDelegate: View {
    @StateObject private var timerManager = TimerManager()
    @EnvironmentObject var mainVM: MainViewModel
    @StateObject private var adviceVM: AdviceViewModel = AdviceViewModel()
    
    var body: some View {
        ZStack {
            TabView {
                MainView()
                    .environmentObject(timerManager)
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                AchievementsView()
                    .environmentObject(mainVM)
                    .tabItem {
                        Label("Achievements", systemImage: "trophy.fill")
                    }
                HealthView()
                    .tabItem {
                        Label("Health", systemImage: "heart.fill")
                    }
            }
            .onAppear {
                mainVM.setupTabBarAppearance()
            }
            
            
            if mainVM.activePopup != nil {
                switch mainVM.activePopup {
                case .know:
                    AdviceView()
                        .environmentObject(mainVM)
                        .environmentObject(adviceVM)
                    
                case .smokedRestart:
                    Color.black.opacity(0.6).ignoresSafeArea(.all)
                    ISmokedPopupView {
                        timerManager.resetTimer()
                        AudioPlayerManager.shared.playSound(res: "again", format: "mp3")
                        mainVM.activePopup = nil
                    }
                case .none:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    HomeDelegate()
        .environmentObject(MainViewModel())
}

