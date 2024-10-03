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
                .padding([.leading, .trailing], dynWidth * 0.0533)
        }
        .frame(height: dynHeight * 0.3)
    }
    private var timerView: some View {
        VStack {
            HStack(spacing: 5) {
                TimeUnitView(timeUnit: Int(timerManager.elapsedTime) / (60 * 60 * 24 * 365), unit: "Y")
                TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / (60 * 60 * 24 * 30)) % 12, unit: "M")
                TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / (60 * 60 * 24 * 7)) % 4, unit: "W")
                TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / (60 * 60 * 24)) % 7, unit: "D")
            }
            HStack(spacing: 5) {
                TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / 3600) % 24, unit: "H")
                TimeUnitView(timeUnit: (Int(timerManager.elapsedTime) / 60) % 60, unit: "M")
                TimeUnitView(timeUnit: Int(timerManager.elapsedTime) % 60, unit: "S")
                TimeUnitView(timeUnit: Int(timerManager.elapsedTime.truncatingRemainder(dividingBy: 1) * 100), unit: "MS")
            }
        }
        .frame(height: dynWidth * 0.45)
    }
}

struct TimeUnitView: View {
    let timeUnit: Int
    let unit: String
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.black, lineWidth: 6)
                    .frame(width: 80, height: 80)
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(ConstantColors.rectangleLinearColor)
                            .overlay {
                                ZStack {
                                    Text(String(format: "%02d", timeUnit))
                                        .font(
                                            .system(size: 34)
                                        )
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    unitView
                                }
                            }
                    }
            }
            
            
        }
    }
    
    private var unitView: some View {
        RoundedRectangle(cornerRadius: 4)
            .stroke(.black, lineWidth: 2)
            .overlay {
                VStack {
                    HStack {
                        Text(unit)
                            .font(.footnote)
                            .foregroundColor(.black)
                            .padding(.all, dynWidth * 0.01333)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(ConstantColors.rectangleLinearColor)
                                    .opacity(0.3)
                            )
                        Spacer()
                    }
                    Spacer()
                }
            }
    }
}

#Preview {
    TimeUnitView(timeUnit: 4, unit: "H")
}
