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
                    ForEach(achievementsViewModel.achievements, id: \.title) { model in
                        AchievementsCellView(model: model)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                }
                .scrollContentBackground(.hidden) // Hides the default background of the list
            }
                
            bottomGradient
            
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

class AchievementsViewModel: ObservableObject {
    var achievements: [AchievementsModel] = []
    init() {
        fetchAchievements()
    }
    func fetchAchievements() {
        achievements = [
            AchievementsModel(title: "NonSmoker1", subtitle: "You are not a smoker anymore", image: Image("no-smoking")),
            AchievementsModel(title: "NonSmoker2", subtitle: "You are not a smoker anymore", image: Image("no-smoking")),
            AchievementsModel(title: "NonSmoker3", subtitle: "You are not a smoker anymore", image: Image("no-smoking")),
            AchievementsModel(title: "NonSmoker4", subtitle: "You are not a smoker anymore", image: Image("no-smoking")),
            AchievementsModel(title: "NonSmoker5", subtitle: "You are not a smoker anymore", image: Image("no-smoking")),
            AchievementsModel(title: "NonSmoker6", subtitle: "You are not a smoker anymore", image: Image("no-smoking")),
            AchievementsModel(title: "NonSmoker7", subtitle: "You are not a smoker anymore", image: Image("no-smoking"))
        ]
    }
}

struct AchievementsModel {
    var title: String
    var subtitle: String
    var image: Image
}


struct AchievementsCellView: View {
    var model: AchievementsModel
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.white)
            .frame(width: dynWidth * 0.9, height: dynWidth * 0.2133)
            .overlay {
                 RoundedRectangle(cornerRadius: 4)
                    .stroke(.black, lineWidth: 4)
                    .overlay {
                        HStack {
                            model.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: dynWidth * 0.12, height: dynWidth * 0.12)
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text(model.title).bold()
                                    .font(.system(size: 22))
                                    
                                Text(model.subtitle)
                                    .font(.system(size: 14))
                            }
                            .foregroundStyle(.black)
                            .padding(.leading, dynWidth * 0.0533)
                            Spacer()
                        }
                        .padding(.all, dynWidth * 0.0533)
                        .frame(width: dynWidth * 0.9, height: dynWidth * 0.2133)
                    }
            }
        
        
    }
}
