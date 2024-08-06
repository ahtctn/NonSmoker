//
//  HealthSheetView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 5.08.2024.
//

import SwiftUI

struct HealthSheetView: View {
    var model: HealthModel
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
                                VStack(alignment: .center, spacing: 30) {
                                    VStack(alignment: .center, spacing: 22) {
                                        Text(model.title).bold()
                                            .font(.system(size: 32))
                                            .foregroundStyle(.black)
                                        
                                        Text(model.explanation)
                                            .font(.system(size: 18))
                                            .foregroundStyle(.black)
                                            .multilineTextAlignment(.center)
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
    HealthSheetView(model: HealthModel(id: 0, title: "öh", subtitle: "bnb", adjective: "nbnb", explanation: "jkj", image: Image("lungs"), healthType: HealthTypeModel(id: 0, name: "sdf", emoj: "kf")), act: {})
}
