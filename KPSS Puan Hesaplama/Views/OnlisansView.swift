//
//  OnlisansView.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 8.08.2024.
//

import SwiftUI


struct OnlisansView: View {
    @StateObject var viewModel = OnlisansViewViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    genelKulturSection
                    genelYetenekSection
                    sonucSection
                }
            }
            .navigationTitle("Önlisans")
        }
    }
    
    private var genelKulturSection: some View {
        Section {
            Stepper("Doğru Sayisi: \(viewModel.gkDogruSayisi)", value: $viewModel.gkDogruSayisi, in: 0...(60 - viewModel.gkYanlisSayisi))
                .bold()
            
            Stepper("Yanlış Sayısı: \(viewModel.gkYanlisSayisi)", value: $viewModel.gkYanlisSayisi, in: 0...(60 - viewModel.gkDogruSayisi))
                .bold()
        } header: {
            Text("Genel Kültür").textCase(.none)
        } footer: {
            if viewModel.gkDogruSayisi + viewModel.gkYanlisSayisi > 60 {
                Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                    .foregroundStyle(.red)
            }
        }
    }
    
    private var genelYetenekSection: some View {
        Section {
            Stepper("Doğru Sayisi: \(viewModel.gyDogruSayisi)", value: $viewModel.gyDogruSayisi, in: 0...(60 - viewModel.gyYanlisSayisi))
                .bold()
            
            Stepper("Yanlış Sayısı: \(viewModel.gyYanlisSayisi)", value: $viewModel.gyYanlisSayisi, in: 0...(60 - viewModel.gyDogruSayisi))
                .bold()
        } header: {
            Text("Genel Yetenek").textCase(.none)
        } footer: {
            if viewModel.gyDogruSayisi + viewModel.gyYanlisSayisi > 60 {
                Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                    .foregroundStyle(.red)
            }
        }
    }
    
    private var sonucSection: some View {
        Section {
            Text("KPSS Puanı: \(viewModel.sonuc, specifier: "%.3f")")
                .bold()
            
            Button("Hesapla") {
                withAnimation {
                    viewModel.hesaplaSonuc()
                }
            }
            .disabled(viewModel.isFormInvalid)
        } header: {
            Text("Sonuç").textCase(.none)
        }
    }
}


#Preview {
    OnlisansView()
}
