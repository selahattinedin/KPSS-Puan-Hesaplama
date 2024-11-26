//
//  EgitimBilimleriViewViewModel.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 23.11.2024.
//

import Foundation
class EgitimBilimleriViewViewModel: ObservableObject {
    @Published var gkDogruSayisi: Double = 40
        @Published var gkYanlisSayisi: Double = 10
        @Published var gyDogruSayisi: Double = 30
        @Published var gyYanlisSayisi: Double = 0
        @Published var ebDogruSayisi: Double = 40
        @Published var ebYanlisSayisi: Double = 0
        
        @Published var sonuc2022: Double = 0
        @Published var sonuc2023: Double = 0
        @Published var EBsonuc2022: Double = 0
        @Published var EBsonuc2023: Double = 0
        @Published var isShowingSheet = false
        
        func hesaplaSonuc() {
            let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
            let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
            let ebNet = ebDogruSayisi - (ebYanlisSayisi / 4)
            
            EBsonuc2022 = Constants.eb2022Puan +
                          gyNet * Constants.eb2022GYKatsayi +
                          gkNet * Constants.eb2022GKKatsayi +
                          ebNet * Constants.eb2022Katsayi
                          
            EBsonuc2023 = Constants.eb2023Puan +
                          gyNet * Constants.eb2023GYKatsayi +
                          gkNet * Constants.eb2023GKKatsayi +
                          ebNet * Constants.eb2023Katsayi
                          
            isShowingSheet = true
        }
    }
    

