//
//  AchievementsView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 28.07.2024.
//

import SwiftUI

struct AchievementsView: View {
    @StateObject var achievementsViewModel: AchievementsViewModel = AchievementsViewModel()
    @EnvironmentObject var mainVM: MainViewModel
    @State private var selectedCell: AchievementsModel? = nil
    
    var body: some View {
        ZStack {
            ConstantColors.baseColor.ignoresSafeArea(.all)
            VStack {
                HeaderView {
                    print("Settings button tapped")
                    
                } knowAct: {
                    withAnimation(.smooth) {
                        mainVM.activePopup = .know
                    }
                }
                List {
                    ForEach(achievementsViewModel.achievements, id: \.id) { model in
                        AchievementsCellView(model: model)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                mainVM.activeSheet = .achievement
                                selectedCell = model
                            }
                    }
                }
                .scrollContentBackground(.hidden)
            }
                
            bottomGradient
            
        }
        
        .sheet(item: $mainVM.activeSheet) { _ in
            switch mainVM.activeSheet {
            case .achievement:
                if let model = selectedCell {
                    AchievementSheetView(model: model) {
                        mainVM.activeSheet = nil
                        selectedCell = nil
                    }
                    .modifier(BottomSheetModifier(0.5))
                }
            case .health:
                EmptyView()
            case nil:
                EmptyView()
            
            }
        }
        
    }
    
    private var bottomGradient: some View {
        VStack {
            Spacer()
            ConstantColors.blackToClearLinearColor.frame(height: dynWidth * 0.3)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    AchievementsView()
        .environmentObject(MainViewModel())
}

