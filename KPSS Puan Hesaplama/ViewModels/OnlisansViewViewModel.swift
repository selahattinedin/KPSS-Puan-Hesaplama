//
//  OnlisansViewViewModel.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 23.11.2024.
//

import Foundation

class OnlisansViewViewModel : ObservableObject{
    @Published var gkDogruSayisi:Double = 40
    @Published var gkYanlisSayisi:Double = 10
    @Published var gyDogruSayisi:Double = 30
    @Published var gyYanlisSayisi:Double = 0
    @Published var sonuc:Double = 0
    
    @Published var sonuc2022:Double = 0
    @Published var sonuc2023: Double = 0
    
    var isFormInvalid: Bool {
            (gkDogruSayisi + gkYanlisSayisi > 60) || (gyDogruSayisi + gyYanlisSayisi > 60)
        }
        
        func hesaplaSonuc() {
            let gkNet = Double(gkDogruSayisi) - Double(gkYanlisSayisi) / 4.0
            let gyNet = Double(gyDogruSayisi) - Double(gyYanlisSayisi) / 4.0
            sonuc = 53.8169 + gyNet * 0.43 + gkNet * 0.397
        }
}
