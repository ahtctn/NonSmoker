//
//  ContentView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 27.07.2024.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject private var timerManager = TimerManager()

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all).opacity(0.9)
            CircleBackgroundView()
            VStack(spacing: 0) {
                HeaderView {
                    print("Settings button tapped")
                }
                
                TimerView(timerManager: timerManager)
                Spacer()
                
                DefaultButtonView("I Smoked, Restart") {
                    timerManager.resetTimer()
                    AudioPlayerManager.shared.playSound()
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
    ContentView()
}
