//
//  AdviceViewModel.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 2.08.2024.
//

import Foundation

class AdviceViewModel: ObservableObject {
    var advices: [AdviceModel] = []
    var randomAdvice: AdviceModel?
    
    init() {
        getAdvices()
        fetchNewAdvice()
    }
    
    
}

//MARK: AdviceViewModel - Get Advices -
extension AdviceViewModel {
    func getAdvices() {
        advices = [
            AdviceModel(title: "Yeni Başlangıçlar", subtitle: "Sigarayı bırak, sağlıklı ve uzun bir hayat için adım at. Araştırmalar, sigarayı bırakmanın yaşam süresini uzattığını gösteriyor."),
            AdviceModel(title: "Temiz Nefes", subtitle: "Sigarayı bırak, derin nefes almanın ve akciğerlerinin temizlenmesinin keyfini çıkar. Akciğer kapasitesi sigarayı bıraktıktan sonraki birkaç ay içinde düzelmeye başlar."),
            AdviceModel(title: "Özgür Ol", subtitle: "Sigaradan kurtul, hayatını dilediğin gibi yaşa. Nikotin bağımlılığından kurtulmak, ruh halini ve enerjini artırır."),
            AdviceModel(title: "Sağlık Seçimi", subtitle: "Sigarayı bırak, sağlıklı yaşama merhaba de. Her yıl sigarayı bırakmak, kalp krizi riskini %50 azaltır."),
            AdviceModel(title: "Hayata Dönüş", subtitle: "Sigarayı bırak, enerjini ve yaşam kaliteni yeniden bul. Sigara içmemek, genel sağlığın yanı sıra cilt sağlığını da iyileştirir."),
            AdviceModel(title: "Temiz Yaşam", subtitle: "Sigarayı bırak, temiz ve ferah bir yaşam sür. Araştırmalar, sigarayı bırakanların daha düşük kanser riski taşıdığını gösteriyor."),
            AdviceModel(title: "Güçlü Kal", subtitle: "Sigarayı bırak, kendine inan ve bağımlılığı yen. Bağımlılıktan kurtulmak, mental ve fiziksel gücünü artırır."),
            AdviceModel(title: "Yeni Sen", subtitle: "Sigarayı bırak, hayatında yeni bir sayfa aç. Sigarayı bırakmak, hem fiziksel hem de psikolojik sağlığını geliştirir."),
            AdviceModel(title: "Sağlıklı Yarınlar", subtitle: "Sigarayı bırak, geleceğini daha sağlıklı bir şekilde inşa et. Sigarayı bırakmak, çocuk sahibi olmayı planlayanlar için doğurganlığı artırır."),
            AdviceModel(title: "Özgür Nefes", subtitle: "Sigarayı bırak, özgürlüğün tadını çıkar ve nefesinin kıymetini bil. Sigarayı bıraktıktan sonra nefes darlığı ve öksürük azalır."),
            AdviceModel(title: "Sağlıklı Gelecek", subtitle: "Sigarayı bırak, geleceğine yatırım yap. Sigara bırakma, kalp sağlığını hızla iyileştirir ve kalp krizi riskini azaltır."),
            AdviceModel(title: "Temiz Ciğerler", subtitle: "Sigarayı bırak, sağlıklı ve temiz ciğerlere kavuş. Akciğerlerin, sigarayı bıraktıktan sonra kendini yenilemeye başlar."),
            AdviceModel(title: "Enerjik Yaşam", subtitle: "Sigarayı bırak, enerjini ve hayat kaliteni artır. Sigara içmemek, daha fazla enerji ve daha iyi bir yaşam kalitesi sağlar."),
            AdviceModel(title: "Daha Güçlü", subtitle: "Sigarayı bırak, güçlü kal ve bağımlılığını yen. Sigara bağımlılığından kurtulmak, fiziksel ve zihinsel dayanıklılığını artırır."),
            AdviceModel(title: "Yeni Başlangıç", subtitle: "Sigarayı bırak, temiz bir sayfa aç ve sağlıklı yaşa. Araştırmalar, sigarayı bırakmanın genel yaşam kalitesini artırdığını gösteriyor."),
            AdviceModel(title: "Özgürlük Seçimi", subtitle: "Sigarayı bırak, özgürlüğünü seç ve daha sağlıklı yaşa. Sigara içmemek, bağımlılığın fiziksel ve psikolojik etkilerinden kurtulmanı sağlar."),
            AdviceModel(title: "Sağlık İlk", subtitle: "Sigarayı bırak, sağlığını ön planda tut ve kaliteli bir yaşam sür. Sigarayı bırakmak, bağışıklık sistemini güçlendirir."),
            AdviceModel(title: "Temiz Hava", subtitle: "Sigarayı bırak, temiz hava sol ve sağlığını koru. Sigara içmemek, solunum yolları enfeksiyonları riskini azaltır."),
            AdviceModel(title: "Daha Mutlu", subtitle: "Sigarayı bırak, daha mutlu ve enerjik bir yaşam sür. Sigara bırakma, ruh halini ve genel mutluluğu artırır."),
            AdviceModel(title: "Güçlü Nefes", subtitle: "Sigarayı bırak, güçlü nefes al ve sağlığını koru. Sigarayı bırakmak, solunum yolu hastalıkları riskini azaltır."),
            AdviceModel(title: "Yeni Hayat", subtitle: "Sigarayı bırak, yeni bir hayata başla ve sağlığını geri kazan. Sigarayı bırakmak, cilt sağlığını ve görünümünü iyileştirir."),
            AdviceModel(title: "Sağlıklı Kal", subtitle: "Sigarayı bırak, sağlıklı kal ve yaşam kaliteni artır. Sigara içmemek, genel sağlık durumunu ve yaşam kalitesini iyileştirir."),
            AdviceModel(title: "Temiz Bir Yaşam", subtitle: "Sigarayı bırak, temiz ve sağlıklı bir yaşam sür. Sigarayı bırakmak, genel sağlık ve refah seviyesini artırır."),
            AdviceModel(title: "Özgür Düşün", subtitle: "Sigarayı bırak, özgürce düşün ve sağlıklı yaşa. Sigarayı bırakmak, zihinsel netliği ve konsantrasyonu artırır."),
            AdviceModel(title: "Sağlıklı Yaşa", subtitle: "Sigarayı bırak, sağlıklı yaşa ve enerjini artır. Sigara bırakma, fiziksel aktivite performansını iyileştirir."),
            AdviceModel(title: "Yeni Umutlar", subtitle: "Sigarayı bırak, yeni umutlara yelken aç ve sağlıklı ol. Sigarayı bırakmak, genel sağlık durumunu ve yaşam kalitesini iyileştirir."),
            AdviceModel(title: "Temiz Gelecek", subtitle: "Sigarayı bırak, temiz bir geleceğe adım at. Sigarayı bırakmak, kalp sağlığını hızla iyileştirir."),
            AdviceModel(title: "Güçlü Kal", subtitle: "Sigarayı bırak, güçlü kal ve bağımlılığını yen. Sigarayı bırakmak, fiziksel ve zihinsel dayanıklılığını artırır."),
            AdviceModel(title: "Yeni Bir Sen", subtitle: "Sigarayı bırak, yeni bir sen ol ve sağlığını koru. Sigarayı bırakmak, fiziksel ve psikolojik sağlığını geliştirir."),
            AdviceModel(title: "Sağlıklı Seçim", subtitle: "Sigarayı bırak, sağlıklı bir seçim yap ve hayatını değiştir. Sigara içmemek, genel sağlık ve refah seviyesini artırır."),
            AdviceModel(title: "Özgür Nefes Al", subtitle: "Sigarayı bırak, özgürce nefes al ve sağlıklı yaşa. Sigarayı bırakmak, solunum yolları enfeksiyonları riskini azaltır."),
            AdviceModel(title: "Yeni Bir Hayat", subtitle: "Sigarayı bırak, yeni bir hayata başla ve sağlığını geri kazan. Sigarayı bırakmak, cilt sağlığını ve görünümünü iyileştirir."),
            AdviceModel(title: "Temiz Bir Gelecek", subtitle: "Sigarayı bırak, temiz bir geleceğe adım at ve sağlığını koru. Sigarayı bırakmak, kalp sağlığını hızla iyileştirir."),
            AdviceModel(title: "Güçlü Bir Yaşam", subtitle: "Sigarayı bırak, güçlü bir yaşam sür ve sağlığını koru. Sigara içmemek, genel sağlık durumunu ve yaşam kalitesini iyileştirir."),
            AdviceModel(title: "Sağlıklı Bir Yaşam", subtitle: "Sigarayı bırak, sağlıklı bir yaşam sür ve enerjini artır. Sigara bırakma, fiziksel aktivite performansını iyileştirir."),
            AdviceModel(title: "Yeni Umutlar", subtitle: "Sigarayı bırak, yeni umutlar yeşert ve sağlıklı yaşa. Sigarayı bırakmak, genel sağlık durumunu ve yaşam kalitesini iyileştirir."),
            AdviceModel(title: "Temiz Bir Başlangıç", subtitle: "Sigarayı bırak, temiz bir başlangıç yap ve sağlığını koru. Sigarayı bırakmak, kalp sağlığını hızla iyileştirir."),
            AdviceModel(title: "Özgür Bir Gelecek", subtitle: "Sigarayı bırak, özgür bir geleceğe yelken aç ve sağlıklı yaşa. Sigara içmemek, genel sağlık durumunu ve yaşam kalitesini iyileştirir."),
            AdviceModel(title: "Sağlıklı Bir Gelecek", subtitle: "Sigarayı bırak, sağlıklı bir geleceğe adım at ve enerjini artır. Sigarayı bırakmak, fiziksel aktivite performansını iyileştirir."),
            AdviceModel(title: "Yeni Bir Umut", subtitle: "Sigarayı bırak, yeni bir umuda yelken aç ve sağlıklı yaşa. Sigarayı bırakmak, genel sağlık durumunu ve yaşam kalitesini iyileştirir."),
            AdviceModel(title: "Temiz Bir Nefes", subtitle: "Sigarayı bırak, temiz bir nefes al ve sağlığını koru. Sigarayı bırakmak, solunum yolları enfeksiyonları riskini azaltır."),
            AdviceModel(title: "Özgür Bir Yaşam", subtitle: "Sigarayı bırak, özgür bir yaşam sür ve sağlığını koru. Sigara içmemek, genel sağlık durumunu ve yaşam kalitesini iyileştirir."),
            AdviceModel(title: "Sağlıklı Bir Seçim", subtitle: "Sigarayı bırak, sağlıklı bir seçim yap ve hayatını değiştir. Sigara içmemek, genel sağlık ve refah seviyesini artırır."),
            AdviceModel(title: "Yeni Bir Başlangıç", subtitle: "Sigarayı bırak, yeni bir başlangıç yap ve sağlığını koru. Sigarayı bırakmak, kalp sağlığını hızla iyileştirir."),
            AdviceModel(title: "Temiz Bir Gelecek", subtitle: "Sigarayı bırak, temiz bir geleceğe adım at ve sağlığını koru. Sigarayı bırakmak, kalp sağlığını hızla iyileştirir."),
            AdviceModel(title: "Özgür Bir Nefes", subtitle: "Sigarayı bırak, özgür bir nefes al ve sağlıklı yaşa. Sigarayı bırakmak, solunum yolları enfeksiyonları riskini azaltır."),
            AdviceModel(title: "Sağlıklı Bir Yaşam", subtitle: "Sigarayı bırak, sağlıklı bir yaşam sür ve enerjini artır. Sigara bırakma, fiziksel aktivite performansını iyileştirir."),
            AdviceModel(title: "Yeni Bir Hayat", subtitle: "Sigarayı bırak, yeni bir hayata başla ve sağlığını geri kazan. Sigarayı bırakmak, cilt sağlığını ve görünümünü iyileştirir."),
            AdviceModel(title: "Temiz Bir Başlangıç", subtitle: "Sigarayı bırak, temiz bir başlangıç yap ve sağlığını koru. Sigarayı bırakmak, kalp sağlığını hızla iyileştirir."),
            AdviceModel(title: "Özgür Bir Gelecek", subtitle: "Sigarayı bırak, özgür bir geleceğe adım at ve sağlıklı yaşa. Sigara içmemek, genel sağlık durumunu ve yaşam kalitesini iyileştirir.")
        ]
    }
    
    func fetchNewAdvice() {
        randomAdvice = advices.randomElement()
    }
}
