//
//  AchievementsCellView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 5.08.2024.
//

import SwiftUI

struct AchievementsCellView: View {
    var model: AchievementsModel
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.white)
            .frame(width: dynWidth * 0.9, height: dynWidth * 0.2133)
            .overlay {
                 RoundedRectangle(cornerRadius: 2)
                    .stroke(.black, lineWidth: 6)
                    .overlay {
                        HStack {
                            HStack(spacing: 2) {
                                model.image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: dynWidth * 0.12, height: dynWidth * 0.12)
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(model.title).bold()
                                        .font(.system(size: 18))
                                        
                                    Text(model.subtitle)
                                        .font(.system(size: 12))
                                }
                                .foregroundStyle(.black)
                                .padding(.leading, dynWidth * 0.0533)
                            }
                            Spacer()
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(.black, lineWidth: 8)
                                .frame(width: dynWidth * 0.15)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(.yellow)
                                        .overlay {
                                            Text(model.adjective).bold()
                                                .font(.system(size: 12))
                                                .foregroundStyle(.black)
                                                .multilineTextAlignment(.center)
                                        }
                                }
                        }
                        .padding(.all, dynWidth * 0.0533)
                        .frame(width: dynWidth * 0.9, height: dynWidth * 0.2133)
                    }
            }
        
        
    }
}

#Preview {
    AchievementsCellView(model: AchievementsModel(id: 0, title: "Title", subtitle: "Subtitle", adjective: "Adjective", explanation: "explanation, this is an explanation mate.", image: Image("lungs")))
}
