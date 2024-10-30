//
//  HealthCellView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 5.08.2024.
//

import SwiftUI

struct HealthCellView: View {
    var model: HealthModel
    var act: () -> ()
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.white)
            .frame(width: dynWidth * 0.35, height: dynWidth * 0.6)
            .overlay {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.black, lineWidth: 4)
                    .overlay {
                        VStack {
                            Spacer().frame(height: dynWidth * 0.05)
                            model.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: dynWidth * 0.2, height: dynHeight * 0.1)
                            Spacer().frame(height: dynWidth * 0.05)
                            VStack(alignment: .leading, spacing: 10) {
                                Text(model.title)
                                    .foregroundStyle(.black)
                                    .bold()
                                    .font(.system(size: 17))
                                    .bold()
                                
                                Text(model.subtitle)
                                    .foregroundStyle(.black)
                                    .bold()
                                    .font(.system(size: 14))
                                    .bold()
                            }
                            
                            Spacer()
                        }
                        .padding([.leading, .trailing], dynWidth * 0.01)
                            
                    }
                    .onTapGesture {
                        act()
                    }
            }
            .padding([.leading, .trailing], dynWidth * 0.01)
    }
    
    
}


#Preview {
    HealthCellView(model: HealthModel(id: 0, title: "kl", subtitle: "lk", adjective: "lk", explanation: "lk", image: Image("lungs"), healthType: HealthTypeModel(id: 0, name: "sdşlf", emoj: "jl")), act: {})
}
