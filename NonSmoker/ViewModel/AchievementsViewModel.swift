//
//  AchievementsViewModel.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 5.08.2024.
//

import SwiftUI

class AchievementsViewModel: ObservableObject {
    var achievements: [AchievementsModel] = []
    init() {
        fetchAchievements()
    }
    func fetchAchievements() {
        achievements = [
            AchievementsModel(id: 0, title: "İlk Adımı Attın.", subtitle: "Başlangıç yapıldı", adjective: "İlk Adım", explanation: "Sigarayı bırakma yolculuğuna başladın. Bu büyük bir adım ve kendine olan inancın ilk zaferini kazandı.", image: Image("lungs")),
            AchievementsModel(id: 1, title: "İlk Haftayı Geride Bıraktın.", subtitle: "İlk hafta geride kaldı", adjective: "Kararlı 1/3", explanation: "Sigarasız geçen ilk haftan. Bu sürede iradenin gücünü kanıtladın. Kararlılığın seni daha ileriye taşıyacak.", image: Image("kararli")),
            AchievementsModel(id: 2, title: "Bir Ay Başarıyla Tamamlandı.", subtitle: "Bir ay geride kaldı", adjective: "Kararlı 2/3", explanation: "Sigarasız geçen ilk ayını tamamladın. Zor olan ilk günleri geride bıraktın. Kararlılığınla gurur duy.", image: Image("kararli")),
            AchievementsModel(id: 3, title: "Üç Aydayız!", subtitle: "Üç ay geride kaldı", adjective: "Kararlı 3/3", explanation: "Sigarasız geçen üçüncü ayını tamamladın. Vücudun nikotinsiz yaşamaya alışıyor. Kararlılığın senin en büyük gücün.", image: Image("kararli")),
            AchievementsModel(id: 4, title: "Altı Ay Boyunca Nikotinsizsin.", subtitle: "Nikotin krizi sona erdi", adjective: "Tutarlı 1/3", explanation: "Altı ay boyunca sigara içmedin. Vücudunda nikotin kalmadı ve ataklar artık sona erdi. Tutarlılığın sayesinde bu zafer senin.", image: Image("right-arrow")),
            AchievementsModel(id: 5, title: "Bir Yılını Temiz Geçirdin.", subtitle: "Nikotin temizliği tamam", adjective: "Tutarlı 2/3", explanation: "Bir yıl boyunca sigara içmedin. Bu süreçte tutarlılığın seni güçlü kıldı ve nikotin krizlerini atlattın.", image: Image("right-arrow")),
            AchievementsModel(id: 6, title: "İki Yıl Başarıyla Geride Kaldı.", subtitle: "İki yıl temizsin", adjective: "Tutarlı 3/3", explanation: "İki yıl boyunca sigara içmedin. Vücudun tamamen temizlendi ve nikotin krizlerinden kurtuldun. Bu büyük bir başarı.", image: Image("right-arrow")),
            AchievementsModel(id: 7, title: "Altı Aydır Sigarasızsın.", subtitle: "Altı ay oldu", adjective: "Sürekli 1/3", explanation: "Altı ay boyunca sigara içmemek büyük bir başarı. Sağlıklı alışkanlıklarını sürdürmeye devam et.", image: Image("consistent")),
            AchievementsModel(id: 8, title: "Sigarasız Geçen Altı Ay.", subtitle: "Altı ay geçti", adjective: "Sürekli 2/3", explanation: "Sigara içmeden altı ay geçirdin. Sağlığın için attığın bu adımlar gelecekte büyük fark yaratacak.", image: Image("consistent")),
            AchievementsModel(id: 9, title: "Altı Ay Başarıyla Tamamlandı.", subtitle: "Altı ayı tamamladın", adjective: "Sürekli 3/3", explanation: "Sigara içmeden geçen altı ayın sonunda, sağlığın ve yaşam kaliten artmaya devam ediyor. Devam et!", image: Image("consistent")),
            AchievementsModel(id: 10, title: "Bir Yıllık Temiz Yaşam.", subtitle: "Bir yıl temizsin", adjective: "Sağlıklı 1/5", explanation: "Bir yıldır sigara içmiyorsun. Bu büyük bir başarı ve sağlığın her geçen gün daha da iyileşiyor.", image: Image("healthy")),
            AchievementsModel(id: 11, title: "Üç Yıldır Temizsin.", subtitle: "Üç yıl temizsin", adjective: "Sağlıklı 2/5", explanation: "Üç yıldır sigara içmiyorsun. Sağlığın önemli ölçüde iyileşti ve bu yolculuğunla gurur duyabilirsin.", image: Image("healthy")),
            AchievementsModel(id: 12, title: "Beş Yıllık Temiz Yaşam.", subtitle: "Beş yıl temizsin", adjective: "Sağlıklı 3/5", explanation: "Beş yıldır sigara içmiyorsun. Bu süreçte kazandığın sağlık ve yaşam kalitesi paha biçilemez.", image: Image("healthy")),
            AchievementsModel(id: 13, title: "On Yıllık Temizlik.", subtitle: "On yıl temizsin", adjective: "Sağlıklı 4/5", explanation: "On yıldır sigara içmiyorsun. Sağlığın ve yaşam kaliten çok daha iyi. Bu yolculukta attığın her adım büyük bir başarı.", image: Image("healthy")),
            AchievementsModel(id: 14, title: "On Beş Yıllık Başarı.", subtitle: "On beş yıl temizsin", adjective: "Sağlıklı 5/5", explanation: "On beş yıldır sigara içmiyorsun. Sağlıklı bir yaşamın tüm faydalarını hissediyorsun. Bu büyük bir zafer.", image: Image("healthy")),
        ]

    }
}
