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
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        ZStack {
            
            TabView {
                MainView()
                    .environmentObject(timerManager)
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                AchievementsView()
                    .tabItem {
                        Label("Achievements", systemImage: "trophy.fill")
                    }
                HealthView()
                    .tabItem {
                        Label("Health", systemImage: "heart.fill")
                    }
            }
            .onAppear {
                mainViewModel.setupTabBarAppearance()
            }
            
            
            
            
            if mainViewModel.smokedPopupShowed {
                Color.black.opacity(0.6).ignoresSafeArea(.all)
                ISmokedPopupView {
                    timerManager.resetTimer()
                    AudioPlayerManager.shared.playSound(res: "again", format: "mp3")
                    mainViewModel.smokedPopupShowed = false
                }
            }
        }
    }
}

#Preview {
    HomeDelegate()
}
