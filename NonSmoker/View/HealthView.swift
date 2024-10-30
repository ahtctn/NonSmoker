//
//  HealthView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 28.07.2024.
//

import SwiftUI

struct HealthView: View {
    @EnvironmentObject var viewModel: HealthViewModel
    @EnvironmentObject var mainVM: MainViewModel
    @EnvironmentObject var timerManager: TimerManager
    
    
    var body: some View {
        ZStack {
            Color.baseClr
                .ignoresSafeArea(.all)
            VStack {
                HeaderView {
                    withAnimation(.smooth) {
                        mainVM.activePopup = .know
                    }
                } settingsAct: {
                    withAnimation(.smooth) {
                        mainVM.activeSheet = .settings
                    }
                }
            
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(viewModel.healthTypes, id: \.name) { type in
                        HStack {
                            HealthSectionHeaderView(model: type)
                            Spacer()
                            if type.id == 0 {
                                MainHealthSectionView(perc: $timerManager.progressPercentage, width: dynWidth * 0.12, height: dynWidth * 0.12, stroke: 4)
                                    .padding(.top, dynWidth * 0.045)
                                    .padding(.trailing, dynWidth * 0.02)
                            }
                            
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(viewModel.health, id: \.id) { health in
                                    if health.healthType.id == type.id {
                                        HealthCellView(model: health) {
                                            viewModel.selectedCell = health
                                            mainVM.activeSheet = .health
                                        }
                                    }
                                }
                            }
                            .padding([.leading, .trailing], dynWidth * 0.05)
                        }
                    }
                }
                
            }
            BottomGradientView()
        }
    }
}

#Preview {
    HealthView()
        .environmentObject(MainViewModel())
}
