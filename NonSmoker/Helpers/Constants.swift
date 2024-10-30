//
//  Constants.swift
//  IJokedRestart
//
//  Created by Ahmet Ali ÇETİN on 23.07.2024.
//

import Foundation
import UIKit
import SwiftUI

var dynWidth = UIScreen.main.bounds.width
var dynHeight = UIScreen.main.bounds.height

enum ConstantColors {
    
    static var rectangleLinearColor: LinearGradient {
        LinearGradient(stops: [
            .init(color: Color.yellowClr.opacity(1), location: 0.6),
            .init(color: Color.yellowClr.opacity(1), location: 1)
        ], startPoint: .bottomLeading, endPoint: .topTrailing)
    }
    
    
    static var blackToClearLinearColor: LinearGradient {
        let stops: [Gradient.Stop] = (0...17).map { i in
            let opacityValue = max(0.0, 1.0 - Double(i) * 0.05) // 0.0'dan 1.0'a kadar opacity değerleri
            return .init(color: Color.thrdBaseClr.opacity(opacityValue), location: Double(i) * 0.05)
        }
        
        return LinearGradient(
            gradient: Gradient(stops: stops + [.init(color: Color.clear, location: 1.0)]), // Sonuncu durumu ekleyin
            startPoint: .bottom,
            endPoint: .top
        )
    }

    
}

import SwiftUI

extension Color {
    // Renklerin tanımları
    static let baseClr = Color(hex: "#48412D")
    static let secBaseClr = Color(hex: "#1F1A12")
    static let thrdBaseClr = Color(hex: "#17130B")
    static let yellowClr = Color(hex: "#FFC300")
    static let secYellowClr = Color(hex: "#755A00")
    static let orangeClr = Color(hex: "#FFA500")
    static let whiteClr = Color(hex: "#F6F6F6")
    static let backgroundClr = Color(hex: "#0D0D0D")
    static let altBackgroundClr = Color(hex: "#232323")
    static let greenClr = Color(hex: "#54E821")
    static let redClr = Color(hex: "#DC2626")
    static let greyClr = Color(hex: "#616161")
    static let clearClr = Color.clear
    
    // Hex renk tanımlama metodu
    init(hex: String) {
        let r, g, b: Double
        
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)  // Hatanın düzeltildiği yer
        
        switch hexSanitized.count {
        case 3: // RGB (e.g. #RGB)
            r = Double((rgb >> 8) & 0xF) / 15.0
            g = Double((rgb >> 4) & 0xF) / 15.0
            b = Double(rgb & 0xF) / 15.0
        case 6: // RGB (e.g. #RRGGBB)
            r = Double((rgb >> 16) & 0xFF) / 255.0
            g = Double((rgb >> 8) & 0xFF) / 255.0
            b = Double(rgb & 0xFF) / 255.0
        default:
            r = 0
            g = 0
            b = 0
        }
        
        self.init(red: r, green: g, blue: b)
    }
}
