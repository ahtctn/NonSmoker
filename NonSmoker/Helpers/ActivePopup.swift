//
//  ActivePopup.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 2.08.2024.
//

import Foundation

enum ActivePopup: Identifiable {
    case know
    case smokedRestart
    
    var id: Int {
        hashValue
    }
}
