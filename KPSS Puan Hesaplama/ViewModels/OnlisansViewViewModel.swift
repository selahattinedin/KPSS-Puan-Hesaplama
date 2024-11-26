//
//  OnlisansViewViewModel.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 23.11.2024.
//

import Foundation

class OnlisansViewViewModel : ObservableObject{
    
        @Published var gkDogruSayisi: Double = 0
        @Published var gkYanlisSayisi: Double = 0
        @Published var gyDogruSayisi: Double = 0
        @Published var gyYanlisSayisi: Double = 0
        @Published var sonuc: Double = 0
        
        var isFormInvalid: Bool {
            (gkDogruSayisi + gkYanlisSayisi) > 60 ||
            (gyDogruSayisi + gyYanlisSayisi) > 60
        }
        
       
        var gkHataMesajiGoster: Bool {
            gkDogruSayisi + gkYanlisSayisi > 60
        }
        
        var gyHataMesajiGoster: Bool {
            gyDogruSayisi + gyYanlisSayisi > 60
        }
        
        var hataMesaji: String {
            "Toplam doğru ve yanlış sayıları 60'ı geçemez."
        }
        
        func hesaplaSonuc() {
            let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
            let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
            
            sonuc = Constants.onlisansPuan +
                    (gyNet * Constants.onlisansGYKatsayi) +
                    (gkNet * Constants.onlisansGKKatsayi)
        }
    }
