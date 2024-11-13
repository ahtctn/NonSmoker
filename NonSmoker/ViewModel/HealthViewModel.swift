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
            HealthModel(id: 0, title: "İlk 20 Dakika", subtitle: "Kalp hızı ve tansiyon normale döner.", adjective: "Başlangıç", explanation: "Sigarayı bırakmanla birlikte vücudun hızla iyileşmeye başlar. İlk 20 dakikada kalp ritmin normale döner ve kan basıncın düşer.", image: Image("roller"), healthType: healthTypes[0]),
            
            HealthModel(id: 1, title: "8 Saat Sonra", subtitle: "Karbon monoksit seviyesi düşer, oksijen seviyesi artar.", adjective: "Başlangıç", explanation: "Sigara dumanındaki karbon monoksit, kanına zarar verir. 8 saat sigarasız geçen sürede bu zararlı madde büyük ölçüde azalır ve kanındaki oksijen seviyesi normale döner.", image: Image("health"), healthType: healthTypes[1]),
            
            HealthModel(id: 2, title: "24 Saat Sonra", subtitle: "Kalp krizi riski düşmeye başlar.", adjective: "Başlangıç", explanation: "İlk 24 saat içerisinde kalp krizi geçirme riskin azalmaya başlar, bu da sağlığın üzerindeki büyük etkilerden biridir.", image: Image("heart"), healthType: healthTypes[1]),
            
            HealthModel(id: 3, title: "48 Saat Sonra", subtitle: "Tat ve koku alma duyuları keskinleşir.", adjective: "İlerleme", explanation: "Sigara bırakmanın ardından 48 saat içinde tat ve koku alma duyuların iyileşmeye başlar. Vücudun kendini hızla toparlıyor.", image: Image("taste"), healthType: healthTypes[1]),
            
            HealthModel(id: 4, title: "1 Hafta Sonra", subtitle: "Nefes alman rahatlar, akciğerlerde temizlik başlar.", adjective: "İlerleme", explanation: "Bu süreçte akciğerlerin temizlenmeye başlar. Nefesin daha rahat bir hal alır ve spor yaparken zorlanman azalır.", image: Image("lungs"), healthType: healthTypes[2]),
            
            HealthModel(id: 5, title: "1 Ay Sonra", subtitle: "Akciğer kapasitesi %30 artar.", adjective: "Güçlenme", explanation: "Bir aylık sürede akciğerlerin önemli ölçüde temizlenir ve kapasitesi artar, bu da günlük aktivitelerinde enerji kazanmanı sağlar.", image: Image("lung-capacity"), healthType: healthTypes[2]),
            
            HealthModel(id: 6, title: "3 Ay Sonra", subtitle: "Dolaşım sistemi iyileşir, öksürük ve nefes darlığı azalır.", adjective: "Güçlenme", explanation: "Vücudun kan dolaşımı daha iyi hale gelir, nefes darlığı ve öksürük gibi sorunlar azalmaya başlar.", image: Image("circulation"), healthType: healthTypes[2]),
            
            HealthModel(id: 7, title: "9 Ay Sonra", subtitle: "Akciğerler tamamen temizlenir, enfeksiyonlara karşı direncin artar.", adjective: "Gelişme", explanation: "Vücudun artık kendini daha güçlü bir şekilde savunur ve soğuk algınlığı gibi enfeksiyonlara karşı direncin artar.", image: Image("immunity"), healthType: healthTypes[3]),
            
            HealthModel(id: 8, title: "1 Yıl Sonra", subtitle: "Kalp hastalığı riski yarı yarıya düşer.", adjective: "Gelişme", explanation: "Kalp ve damar sağlığın ciddi ölçüde iyileşir. Kalp krizi riskin azalır ve vücudun daha güçlü hale gelir.", image: Image("heart-health"), healthType: healthTypes[3]),
            
            HealthModel(id: 9, title: "5 Yıl Sonra", subtitle: "Felç riski sigara içmeyen birine yaklaşır.", adjective: "Sağlıklı Yaşam", explanation: "Vücudun, sigara içmeyen birinin sağlığına yakın hale gelir ve felç geçirme riski azalır.", image: Image("brain-health"), healthType: healthTypes[4]),
            
            HealthModel(id: 10, title: "10 Yıl Sonra", subtitle: "Akciğer kanseri riski yarı yarıya azalır.", adjective: "Sağlıklı Yaşam", explanation: "Akciğerlerin ve diğer organların iyileşmesi, kanser riskini azaltır. Bu sürede vücudun yeniden yapılanır ve sağlıklı yaşam sürme şansın artar.", image: Image("lung-cancer-risk"), healthType: healthTypes[4]),
            
            HealthModel(id: 11, title: "15 Yıl Sonra", subtitle: "Kalp hastalığı riski sigara içmeyen biriyle eşitlenir.", adjective: "Sağlıklı Yaşam", explanation: "Vücudun tamamen temizlenir ve sağlığın sigara içmemiş bir kişiyle eşdeğer hale gelir. Sağlık yolculuğunda önemli bir başarıya ulaştın.", image: Image("total-health"), healthType: healthTypes[4])
        ]
    }

}


struct HealthTypeModel {
    var id: Int
    var name: String
    var emoj: String
}
