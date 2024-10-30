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
    @StateObject var healthVM: HealthViewModel = HealthViewModel()
    @StateObject var achievementsVM: AchievementsViewModel = AchievementsViewModel()
    
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
                    .environmentObject(achievementsVM)
                    .tabItem {
                        Label("Achievements", systemImage: "trophy.fill")
                    }
                HealthView()
                    .environmentObject(mainVM)
                    .environmentObject(timerManager)
                    .tabItem {
                        Label("Health", systemImage: "heart.fill")
                    }
                    .environmentObject(healthVM)
            }
            .onAppear {
                mainVM.setupTabBarAppearance()
            }
            
            .sheet(item: $mainVM.activeSheet) { _ in
                switch mainVM.activeSheet {
                case .achievement:
                    if let model = achievementsVM.selectedCell {
                        AchievementSheetView(model: model) {
                            mainVM.activeSheet = nil
                            achievementsVM.selectedCell = nil
                        }
                        .modifier(BottomSheetModifier(0.5))
                    }
                case .health:
                    if let cell = healthVM.selectedCell {
                        HealthSheetView(model: cell) {
                            mainVM.activeSheet = nil
                            healthVM.selectedCell = nil
                        }
                        .modifier(BottomSheetModifier(0.5))
                    }
                case .settings:
                    SettingsView()
                        .environmentObject(mainVM)
                        .modifier(BottomSheetModifier(0.88))
                case .none:
                    EmptyView()
                    
                }
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

