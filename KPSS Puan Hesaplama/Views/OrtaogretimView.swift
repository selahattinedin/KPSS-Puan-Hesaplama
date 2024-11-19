//
//  OrtaogretimView.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 8.08.2024.
//

import SwiftUI

struct OrtaogretimView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State var gkDogruSayisi:Double = 40
    @State var gkYanlisSayisi:Double = 10
    @State var gyDogruSayisi:Double = 30
    @State var gyYanlisSayisi:Double = 0
    @State var sonuc:Double = 0
    
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
                        Text("KPSS Puanı: \(sonuc, specifier: "%.3f") ")
                            .bold()
                        
                        HesaplaButton(title: "Hesapla") {
                            let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                            let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                            
                            withAnimation {
                                sonuc = Constants.ortaogretimPuan + gyNet * Constants.ortaogretimGYKatsayi + gkNet * Constants.ortaogretimGKKatsayi
                            }
                            
                            let result = Result(sinavAdi: "2022 Ortaöğretim KPSS", gyNet: gyNet, gkNet: gkNet, sonuc: sonuc)
                            modelContext.insert(result)
                        }
                        .disabled(formKontrol)
                        .sensoryFeedback(.selection, trigger: sonuc)
                        
                    }header: {
                        Text("Sonuç")
                            .textCase(.none)
                    }
                    
                }
            }.navigationTitle("Ortaöğretim")
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
    OrtaogretimView()
}
