//
//  HealthViewModel.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 5.08.2024.
//

import SwiftUI

class HealthViewModel: ObservableObject {
    @Published var selectedCell: HealthModel? = nil
    var health: [HealthModel] = []
    var healthTypes = [
        HealthTypeModel(id: 0, name: "Started", emoj: "🏁"),
        HealthTypeModel(id: 1, name: "No More Cravings", emoj: "💪🏻"),
        HealthTypeModel(id: 2, name: "Low-Cancer Risk", emoj: "😷"),
        HealthTypeModel(id: 3, name: "Breather", emoj: "🫁"),
        HealthTypeModel(id: 4, name: "Immune", emoj: "💉"),
    ]
    
    init() {
        fetchHealthData()
    }
    
    func fetchHealthData() {
        health = [
            HealthModel(id: 0, title: "Karbonmonoksit", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("roller"), healthType: healthTypes[0]),
            HealthModel(id: 1, title: "İyileşme 1", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("health"), healthType: healthTypes[1]),
            HealthModel(id: 2, title: "İyileşme 1", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("health"), healthType: healthTypes[1]),
            HealthModel(id: 3, title: "İyileşme 1", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("health"), healthType: healthTypes[1]),
            HealthModel(id: 4, title: "İyileşme 1", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("health"), healthType: healthTypes[1]),
            
            HealthModel(id: 5, title: "İyileşme 2", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("lung-cancer"), healthType: healthTypes[2]),
            HealthModel(id: 6, title: "İyileşme 2", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("lung-cancer"), healthType: healthTypes[2]),
            HealthModel(id: 7, title: "İyileşme 2", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("lung-cancer"), healthType: healthTypes[2]),
            
            HealthModel(id: 8, title: "İyileşme 3", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("breathing"), healthType: healthTypes[3]),
            HealthModel(id: 9, title: "İyileşme 3", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("breathing"), healthType: healthTypes[3]),
            HealthModel(id: 10, title: "İyileşme 3", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("breathing"), healthType: healthTypes[3]),
            
            HealthModel(id: 11, title: "İyileşme 4", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("immune"), healthType: healthTypes[4]),
            HealthModel(id: 12, title: "İyileşme 4", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("immune"), healthType: healthTypes[4]),
            HealthModel(id: 13, title: "İyileşme 4", subtitle: "Vücudundaki karbonmonoksit seviyesi yarıya indi.", adjective: "Started.", explanation: "Vücudundaki karbonmonoksit seviyesi yarıya indi. Vücudun iyileşme emareleri gösteriyor.", image: Image("immune"), healthType: healthTypes[4]),
        ]
    }
}


struct HealthTypeModel {
    var id: Int
    var name: String
    var emoj: String
}
