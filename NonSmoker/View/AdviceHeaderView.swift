//
//  AdviceHeaderView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 22.11.2024.
//

import SwiftUI

struct AdviceHeaderView: View {
    var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(.black, lineWidth: 5)
            .frame(width: dynWidth * 0.4, height: dynWidth * 0.1)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .overlay {
                        Text(text).bold()
                    }
            }
    }
}

#Preview {
    AdviceHeaderView(text: "Advice")
}
