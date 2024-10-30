//
//  HealthSectionHeaderView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 30.10.2024.
//

import SwiftUI


struct HealthSectionHeaderView: View {
    var model: HealthTypeModel
    
    var body: some View {
        HStack {
            
            let text = "\(model.name) \(model.emoj)"
            let textWidth = text.size(withAttributes: [.font: UIFont.systemFont(ofSize: 16)]).width
            let rectangleWidth = textWidth + (dynWidth * 0.1)
            
            RoundedRectangle(cornerRadius: 4)
                .fill(.yellow)
                .frame(width: rectangleWidth, height: dynWidth * 0.1006)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.black, lineWidth: 4)
                        .overlay {
                            HStack {
                                Text(text)
                                    .bold()
                                    .font(.system(size: 16))
                                    .padding(.leading, dynWidth * 0.021)
                                Spacer()
                            }
                        }
                }
                .padding([.top, .leading], dynWidth * 0.05333)
            Spacer()
        }
    }
}


#Preview {
    HealthSectionHeaderView(model: .init(id: 0, name: "Ahmet", emoj: "xd"))
}


