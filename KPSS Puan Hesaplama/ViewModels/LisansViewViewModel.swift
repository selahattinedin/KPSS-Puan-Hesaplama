//
//  LisansViewViewModel.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 23.11.2024.
//

import Foundation
class LisansViewViewModel:ObservableObject{
        @Published var gkDogruSayisi: Double = 40
        @Published var gkYanlisSayisi: Double = 10
        @Published var gyDogruSayisi: Double = 30
        @Published var gyYanlisSayisi: Double = 0
        
        @Published var sonuc2022: Double = 0
        @Published var sonuc2023: Double = 0
        
        var formKontrol: Bool {
            (gkDogruSayisi + gkYanlisSayisi) > 60 || (gyDogruSayisi + gyYanlisSayisi) > 60
        }
        
        var gkHataMesaji: Bool {
            gkDogruSayisi + gkYanlisSayisi > 60
        }
        
        var gyHataMesaji: Bool {
            gyDogruSayisi + gyYanlisSayisi > 60
        }
        
        func hesapla() {
            let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
            let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
            
         
            sonuc2022 = Constants.lisans2022Puan +
                                (gyNet * Constants.lisans2022GYKatsayi) +
                                (gkNet * Constants.lisans2022GKKatsayi)
                
            sonuc2023 = Constants.lisans2023Puan +
                                (gyNet * Constants.lisans2023GYKatsayi) +
                                (gkNet * Constants.lisans2023GKKatsayi)
        }
    }

