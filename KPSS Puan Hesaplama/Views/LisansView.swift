//
//  LisansView.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 8.08.2024.
//

import SwiftUI

struct LisansView: View {
    
    @State var gkDogruSayisi:Double = 40
    @State var gkYanlisSayisi:Double = 10
    @State var gyDogruSayisi:Double = 30
    @State var gyYanlisSayisi:Double = 0
    
    @State var sonuc2022:Double = 0
    @State var sonuc2023: Double = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Form{
                    
                    Section{
                        Stepper("Doğru Sayisi: \(gkDogruSayisi, specifier: "%.0f")", value: $gkDogruSayisi, in: 0...(60-gkYanlisSayisi))
                            .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                            .bold()
                        
                        Stepper("Yanlış Sayısı: \(gkYanlisSayisi, specifier: "%.0f")", value: $gkYanlisSayisi, in: 0...(60-gkDogruSayisi))
                            .sensoryFeedback(.selection, trigger: gkYanlisSayisi)
                            .bold()

                        
                    }header: {
                        Text("Genel Kültür")
                            .textCase(.none)
                    }footer: {
                        if(gkDogruSayisi + gkYanlisSayisi > 60){
                            Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                                .foregroundStyle(.red)
                        }
                    }
                    
                    
                    Section{
                        Stepper("Doğru Sayisi: \(gyDogruSayisi, specifier: "%.0f")", value: $gyDogruSayisi, in: 0...(60 - gyYanlisSayisi))
                            .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                            .bold()
                        
                        Stepper("Yanlış Sayısı: \(gyYanlisSayisi, specifier: "%.0f")", value: $gyYanlisSayisi, in: 0...(60-gyDogruSayisi))
                            .sensoryFeedback(.selection, trigger: gyYanlisSayisi)
                            .bold()

                        
                    }header: {
                        Text("Genel Yetenek")
                            .textCase(.none)
                    }footer: {
                        if(gyDogruSayisi + gyYanlisSayisi > 60){
                            Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                                .foregroundStyle(.red)
                        }
                    }
                    
                    
                    Section{
                        Text("2023 KPSS Puanı: \(sonuc2023, specifier: "%.3f")")
                            .bold()
                        Text("2022 KPSS Puanı: \(sonuc2022, specifier: "%.3f")")
                            .bold()
                        
                        HesaplaButton(title: "Hesapla") {
                            let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                            let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                            
                            withAnimation {
                                sonuc2022 = ( 51.209 + gyNet * 0.537 + gkNet * 0.418)
                                sonuc2023 =  (48.616 + gyNet * 0.4756 + gkNet * 0.4192)
                            }
                        }
                        .disabled(formKontrol)
                        .sensoryFeedback(.selection, trigger: sonuc2022)
                        
                    }header: {
                        Text("Sonuç")
                            .textCase(.none)
                    }
                    
                }
            }.navigationTitle("Lisans (B Grubu)")
        }
    }
    
    var formKontrol:Bool{
        if((gkDogruSayisi + gkYanlisSayisi) > 60 || (gyDogruSayisi + gyDogruSayisi) > 60 ){
            true
        }
        return false
    }
}

#Preview {
    LisansView()
}
