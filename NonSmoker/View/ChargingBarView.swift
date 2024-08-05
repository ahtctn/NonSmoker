//
//  ChargingBarView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 4.08.2024.
//

import SwiftUI

struct ChargingBarView: View {
    var percentage: Double
    var width: Double
    var height: Double
    
    init(perc: Double,
         width: Double = dynWidth * 0.4,
         height: Double = dynWidth * 0.4) {
        self.percentage = perc
        self.width = width
        self.height = height
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.opacity(0.3))
            
            RoundedRectangle(cornerRadius: 4)
                .fill(getColor(percentage))
                .frame(height: (height) * CGFloat(percentage / 100))
        }
        .frame(width: width, height: height)
        .cornerRadius(10)
        .overlay(
            VStack(alignment: .leading) {
                if width >= dynWidth * 0.4 {
                    Text("Health")
                        .font(
                            .system(size: 34)
                        )
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                
                Text("\(Int(percentage))%")
                    .font(
                        .system(size: 24)
                    )
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            
        )
    }
    
    func getColor(_ perc: Double) -> Color {
        switch perc {
            case 0..<20:
                return Color.red
            case 20..<50:
                return Color.orange
            case 50..<80:
                return Color.yellow
            case 80...100:
                return Color.green
            default:
                return Color.gray // Geçersiz bir değer için varsayılan renk
            }
    }
}


#Preview {
    ChargingBarView(perc: 85)
}
