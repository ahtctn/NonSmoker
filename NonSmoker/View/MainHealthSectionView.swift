//
//  MainHealthSectionView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 4.08.2024.
//

import SwiftUI

struct MainHealthSectionView: View {
    @Binding var perc: Double
    var body: some View {
        VStack {
            ChargingBarView(percentage: perc)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.black, lineWidth: 10)
                        .frame(width: dynWidth * 0.4, height: dynWidth * 0.4)
                }
        }
    }
}

#Preview {
    MainHealthSectionView(perc: .constant(56))
}

