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


struct AnimatedGradient: View {
    @State private var gradientStart = UnitPoint(x: 0, y: -1)
    @State private var gradientEnd = UnitPoint(x: 1, y: 0)
    
    var colors: [Color]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: gradientStart, endPoint: gradientEnd)
            .onAppear {
                withAnimation(Animation.linear(duration: 8).repeatForever(autoreverses: true)) {
                    gradientStart = UnitPoint(x: 1, y: 1)
                    gradientEnd = UnitPoint(x: 0, y: 1)
                }
            }
    }
}

