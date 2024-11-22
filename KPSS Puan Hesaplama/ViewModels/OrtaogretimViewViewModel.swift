//
//  OrtaogretimViewViewModel.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 21.11.2024.
//

import Foundation
import SwiftUI

class OrtaogretimViewModel: ObservableObject {
    @Published var gkDogruSayisi: Double = 40
    @Published var gkYanlisSayisi: Double = 10
    @Published var gyDogruSayisi: Double = 30
    @Published var gyYanlisSayisi: Double = 0
    @Published var sonuc: Double = 0
    
    var formKontrol: Bool {
        (gkDogruSayisi + gkYanlisSayisi) > 60 || (gyDogruSayisi + gyDogruSayisi) > 60
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
        sonuc = Constants.ortaogretimPuan + gyNet * Constants.ortaogretimGYKatsayi + gkNet * Constants.ortaogretimGKKatsayi
    }
}
