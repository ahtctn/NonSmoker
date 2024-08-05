//
//  MainHealthSectionView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 4.08.2024.
//

import SwiftUI

struct MainHealthSectionView: View {
    @Binding var perc: Double
    var width: Double
    var height: Double
    
    init(perc: Binding<Double>,
         width: Double = dynWidth * 0.4,
         height: Double = dynWidth * 0.4) {
        _perc = perc
        self.width = width
        self.height = height
    }
    
    var body: some View {
        VStack {
            ChargingBarView(perc: perc, width: width, height: height)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.black, lineWidth: 10)
                        .frame(width: width, height: height)
                }
        }
    }
}

#Preview {
    MainHealthSectionView(perc: .constant(7))
}

