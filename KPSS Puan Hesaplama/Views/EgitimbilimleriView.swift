//
//  EgitimbilimleriView.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 8.08.2024.
//

import SwiftUI

struct EgitimBilimleriView: View {
    
    @State var gkDogruSayisi:Double = 40
    @State var gkYanlisSayisi:Double = 10
    @State var gyDogruSayisi:Double = 30
    @State var gyYanlisSayisi:Double = 0
    @State var ebDogruSayisi:Double = 40
    @State var ebYanlisSayisi:Double = 0
    
    @State var sonuc2022:Double = 0
    @State var sonuc2023: Double = 0
    @State var EBsonuc2022:Double = 0
    @State var EBsonuc2023:Double = 0
    
    @State private var isShowingSheet = false

    
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
                        Stepper("Doğru Sayisi: \(ebDogruSayisi, specifier: "%.0f")", value: $ebDogruSayisi, in: 0...(80 - ebYanlisSayisi))
                            .sensoryFeedback(.selection, trigger: ebDogruSayisi)
                            .bold()
                        
                        Stepper("Yanlış Sayısı: \(ebYanlisSayisi, specifier: "%.0f")", value: $ebYanlisSayisi, in: 0...(80-ebDogruSayisi))
                            .sensoryFeedback(.selection, trigger: ebYanlisSayisi)
                            .bold()
                        
                        HesaplaButton(title: "Hesapla") {
                            let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                            let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                            let ebNet = ebDogruSayisi - (ebYanlisSayisi / 4)
                            
                            withAnimation {
                                EBsonuc2022 = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                                sonuc2022 = ( 48.616 + gyNet * 0.4756 + gkNet * 0.4192)
                                EBsonuc2023 = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                                sonuc2023 =  (51.209 + gyNet * 0.537 + gkNet * 0.418)
                                
                                isShowingSheet.toggle()
                            }
                        }
                        .disabled(formKontrol)
                        .sensoryFeedback(.selection, trigger: sonuc2022)
                        .sheet(isPresented: $isShowingSheet){
                            SonucView(sonuc2023: sonuc2023, EBsonuc2023: EBsonuc2023, oabtsonuc2023: nil, oabtsonuc2022: nil, EBsonuc2022: EBsonuc2022, sonuc2022: EBsonuc2022)
                        
                        }

                        
                    }header: {
                        Text("Eğitim Bilimleri")
                            .textCase(.none)
                    }footer: {
                        if(ebDogruSayisi + ebYanlisSayisi > 80){
                            Text("Toplam doğru ve yanlış sayıları 80'ı geçemez.")
                                .foregroundStyle(.red)
                        }
                    }
                    
                    
                    
                    
                    
                }
            }.navigationTitle("Eğitim Bilimleri")
        }
    }
    
    var formKontrol:Bool{
        if((gkDogruSayisi + gkYanlisSayisi) > 60 || (gyDogruSayisi + gyDogruSayisi) > 60 || (ebDogruSayisi + ebYanlisSayisi) > 80 ){
            true
        }
        return false
    }
}

#Preview {
    EgitimBilimleriView()
}
