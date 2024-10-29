//
//  SettingsViewModel.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 30.10.2024.
//

import Foundation
import UIKit

class SettingsViewModel: ObservableObject {
    
    func openBookURL() {
        if let url = URL(string: "https://www.amazon.it/s?k=Quit+smoking&i=stripbooks&linkCode=gs3&tag=quitnowapp08-21") {
            UIApplication.shared.open(url)
        }
    }
    
}
