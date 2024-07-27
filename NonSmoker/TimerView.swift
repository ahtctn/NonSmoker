//
//  TimerView.swift
//  IJokedRestart
//
//  Created by Ahmet Ali ÇETİN on 23.07.2024.
//


import SwiftUI

struct TimerView: View {
    @ObservedObject var timerManager: TimerManager

    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea(.all)
            timerView
        }
        .frame(height: dynHeight * 0.3)
    }
    
    private var sepratorDots: some View {
        VStack {
            Spacer()
            Text(":")
                .foregroundStyle(.white)
                .font(
                    .system(size: 26)
                )
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        }
    }
    
    private var timerView: some View {
        VStack {
            HStack(spacing: 10) {
                TimeUnitView(timeUnit: Int(timerManager.elapsedTime) / (60 * 60 * 24 * 365), unit: "Y")
                sepratorDots
                TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / (60 * 60 * 24 * 30)) % 12, unit: "M")
                sepratorDots
                TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / (60 * 60 * 24 * 7)) % 4, unit: "W")
                sepratorDots
                TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / (60 * 60 * 24)) % 7, unit: "D")
            }
            HStack(spacing: 10) {
                TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / 3600) % 24, unit: "H")
                sepratorDots
                TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / 60) % 60, unit: "M")
                sepratorDots
                TimeUnitView(timeUnit: Int(timerManager.elapsedTime) % 60, unit: "S")
                sepratorDots
                TimeUnitView(timeUnit: Int(timerManager.elapsedTime.truncatingRemainder(dividingBy: 1) * 100), unit: "MS")
            }
        }
        .frame(height: dynWidth * 0.45)
    }
}

struct TimeUnitView: View {
    let timeUnit: Int
    let unit: String
    
    private var rectangleLinearColor: LinearGradient {
        LinearGradient(stops: [.init(color: Color.blue.opacity(1),
                                     location: 0.6),
                               .init(color: Color.mint.opacity(1),
                                     location: 1)],
                       startPoint: .bottomLeading,
                       endPoint: .topTrailing)
    }
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color.clear)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.mint]),
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        ).opacity(0.5)
                    )
                    .overlay(
                        ZStack {
                            Text(String(format: "%02d", timeUnit))
                                .font(
                                    .system(size: 34)
                                )
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            unitView
                        }
                        
                    )
                    .cornerRadius(10)
            }
            
            
        }
    }
    
    private var unitView: some View {
        VStack {
            HStack {
                Text(unit)
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.all, dynWidth * 0.01333)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [Color.black, Color.gray]),
                                startPoint: .bottomLeading,
                                endPoint: .topTrailing
                            ))
                            .opacity(0.3)
                    )
                Spacer()
            }
            Spacer()
        }
    }
}
