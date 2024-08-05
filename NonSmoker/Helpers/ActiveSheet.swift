//
//  ActiveSheet.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 5.08.2024.
//

import Foundation

enum ActiveSheet: Identifiable {
    case achievement
    case health
    
    var id: Int {
        hashValue
    }
}
