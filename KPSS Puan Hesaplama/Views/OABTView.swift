//
//  OABTView.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 8.08.2024.
//

import SwiftUI

struct OABTView: View {

    @State var gkDogruSayisi:Double = 40
    @State var gkYanlisSayisi:Double = 10
    @State var gyDogruSayisi:Double = 30
    @State var gyYanlisSayisi:Double = 0
    @State var ebDogruSayisi:Double = 40
    @State var ebYanlisSayisi:Double = 0
    @State var oabtDogruSayisi:Double = 40
    @State var oabtYanlisSayisi:Double = 0
        
    @State var sonuc2022:Double = 0
    @State var sonuc2023: Double = 0
    @State var EBsonuc2022:Double = 0
    @State var EBsonuc2023:Double = 0
    @State var oabtsonuc2023:Double = 0
    @State var oabtsonuc2022:Double = 0
    
    @State private var oabtKatsayi = 0.4334
    @State private var oabtPuan = 43.805
    
    @State private var selectedOption = 0
        let options = [
            (0.4334,43.805, "Beden Eğitimi"),
            (0.3666,41.071, "Biyoloji"),
            (0.4301,39.060, "Coğrafya"),
            (0.4052,34.908, "Din Kültürü"),
            (0.3679,42.156, "Edebiyat"),
            (0.5388,39.313, "Fen Bilgisi"),
            (0.3817,41.604, "Fizik"),
            (0.5225,36.309, "İlköğretim Matematik"),
            (0.3883,37.962, "İmam Hatip Meslek Dersleri Ö."),
            (0.3791,40.920, "İngilizce"),
            (0.4542,42.157, "Kimya"),
            (0.4247,41.759, "Lise Matematik"),
            (0.4944,33.292, "Okul Öncesi"),
            (0.4883,29.014, "Rehberlik "),
            (0.6184,33.598, "Sınıf Öğretmenliği"),
            (0.6142,34.101, "Sosyal Bilgiler"),
            (0.3521,41.418, "Tarih"),
            (0.4565,34.329, "Türkçe")
        ]
    
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

                            
                        }header: {
                            Text("Eğitim Bilimleri")
                                .textCase(.none)
                        }footer: {
                            if(ebDogruSayisi + ebYanlisSayisi > 80){
                                Text("Toplam doğru ve yanlış sayıları 80'ı geçemez.")
                                    .foregroundStyle(.red)
                            }
                        }
                    
                    Section{
                        Picker("Bölüm Seçiniz", selection: $selectedOption) {
                            ForEach(0..<options.count, id: \.self){ index in
                                HStack{
                                    Image(systemName: "person.circle.fill")
                                    Text(options[index].2)
                                }
                                
                            }
                        }
                        Stepper("Doğru Sayisi: \(oabtDogruSayisi, specifier: "%.0f")", value: $oabtDogruSayisi, in: 0...(75 - oabtYanlisSayisi))
                            .sensoryFeedback(.selection, trigger: oabtDogruSayisi)
                            .bold()
                            
                        Stepper("Yanlış Sayısı: \(oabtYanlisSayisi, specifier: "%.0f")", value: $oabtYanlisSayisi, in: 0...(75 - oabtDogruSayisi))
                                .sensoryFeedback(.selection, trigger: oabtYanlisSayisi)
                                .bold()
                        
                        HesaplaButton(title: "Hesapla") {
                            let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                            let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                            let ebNet = ebDogruSayisi - (ebYanlisSayisi / 4)
                            let oabtNet = oabtDogruSayisi - (oabtYanlisSayisi / 4)
                                
                                withAnimation {
                                    EBsonuc2022 = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                                    sonuc2022 = ( 48.616 + gyNet * 0.4756 + gkNet * 0.4192)
                                    EBsonuc2023 = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                                    sonuc2023 =  (51.209 + gyNet * 0.537 + gkNet * 0.418)
                                    oabtsonuc2022 = oabtPuan + gyNet * 0.1720 + gkNet * 0.1515 + ebNet * 0.1498 + oabtNet * oabtKatsayi
                                    isShowingSheet.toggle()
                                }
                            }
                            .disabled(formKontrol)
                            .sensoryFeedback(.selection, trigger: sonuc2022)
                            .sheet(isPresented: $isShowingSheet) {
                                SonucView(sonuc2023: sonuc2023, EBsonuc2023: EBsonuc2023, oabtsonuc2023: oabtsonuc2023, oabtsonuc2022: oabtsonuc2022, EBsonuc2022: EBsonuc2022, sonuc2022: sonuc2022)
                            }

                            
                        }header: {
                            Text("ÖABT")
                                .textCase(.none)
                        }footer: {
                            if(oabtDogruSayisi + oabtYanlisSayisi > 75){
                                Text("Toplam doğru ve yanlış sayıları 75'i geçemez.")
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                }.navigationTitle("ÖABT")
            }
        }
        
        var formKontrol:Bool{
            if((gkDogruSayisi + gkYanlisSayisi) > 60 || (gyDogruSayisi + gyDogruSayisi) > 60 || (ebDogruSayisi + ebYanlisSayisi) > 80 || (oabtDogruSayisi + oabtYanlisSayisi) > 75){
                true
            }
            return false
        }
    }
#Preview {
    OABTView()
}
