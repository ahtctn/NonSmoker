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
            .init(color: Color.yellow.opacity(1), location: 0.6),
            .init(color: Color.yellow.opacity(1), location: 1)
        ], startPoint: .bottomLeading, endPoint: .topTrailing)
    }
    
    static var blackToClearLinearColor: LinearGradient {
        LinearGradient(
                    gradient: Gradient(colors: [Color.clear, Color.black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
    }
    
    static var baseColor: LinearGradient {
        LinearGradient(stops: [
            .init(color: Color("base1"), location: 0.6),
            .init(color: Color("base2"), location: 1)
        ], startPoint: .top, endPoint: .bottom)
    }
    
}
