//
//  AchievementsView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 28.07.2024.
//

import SwiftUI

struct AchievementsView: View {
    @EnvironmentObject var viewModel: AchievementsViewModel
    @EnvironmentObject var mainVM: MainViewModel
    
    var body: some View {
        ZStack {
            Color.baseClr.ignoresSafeArea(.all)
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
                
                List {
                    ForEach(viewModel.achievements, id: \.id) { model in
                        AchievementsCellView(model: model)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                mainVM.activeSheet = .achievement
                                viewModel.selectedCell = model
                            }
                    }
                }
                .scrollContentBackground(.hidden)
            }
                
            BottomGradientView()
            
        }
    }
}

#Preview {
    AchievementsView()
        .environmentObject(MainViewModel())
        .environmentObject(AchievementsViewModel())
}

