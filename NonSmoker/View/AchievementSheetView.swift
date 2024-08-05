//
//  AchievementSheetView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 5.08.2024.
//

import SwiftUI

struct AchievementSheetView: View {
    var model: AchievementsModel
    var act: () -> ()
    var body: some View {
        ZStack {
            Color("base2").ignoresSafeArea(.all)
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.white)
                    .frame(width: dynWidth * 0.9, height: dynHeight * 0.35)
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.black, lineWidth: 8)
                            .overlay {
                                VStack(alignment: .leading, spacing: 30) {
                                    VStack(alignment: .leading, spacing: 22) {
                                        Text(model.title).bold()
                                            .font(.system(size: 32))
                                            .foregroundStyle(.black)
                                        
                                        Text(model.explanation)
                                            .font(.system(size: 18))
                                            .foregroundStyle(.black)
                                    }
                                    
                                    DefaultButtonView(width: 0.7, "Okay") {
                                        act()
                                    }
                                }
                            }
                    }
            }
            .padding(.top, dynWidth * 0.0266)
            
            
                .frame(minHeight: dynHeight * 0.4)
        }
    }
}

#Preview {
    AchievementSheetView(model: AchievementsModel(id: 0, title: "Model", subtitle: "Subtitle", adjective: "Adjective", explanation: "Açıklama bu bir açıklamadır evet bu bir açıklamadır.", image: Image("lungs"))) { }
}
