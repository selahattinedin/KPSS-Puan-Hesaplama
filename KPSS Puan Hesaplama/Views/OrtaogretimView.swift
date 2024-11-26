//
//  OrtaogretimView.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 8.08.2024.
//

import SwiftUI

struct OrtaogretimView: View {
    @StateObject private var viewModel = OrtaogretimViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    genelKulturSection
                    genelYetenekSection
                    sonucSection
                }
            }
            .navigationTitle("Ortaöğretim")
        }
    }
    
    private var genelKulturSection: some View {
        Section {
            Stepper("Doğru Sayisi: \(viewModel.gkDogruSayisi, specifier: "%.0f")",
                    value: $viewModel.gkDogruSayisi,
                    in: 0...(60-viewModel.gkYanlisSayisi))
                .sensoryFeedback(.selection, trigger: viewModel.gkDogruSayisi)
                .bold()
            
            Stepper("Yanlış Sayısı: \(viewModel.gkYanlisSayisi, specifier: "%.0f")",
                    value: $viewModel.gkYanlisSayisi,
                    in: 0...(60-viewModel.gkDogruSayisi))
                .sensoryFeedback(.selection, trigger: viewModel.gkYanlisSayisi)
                .bold()
        } header: {
            Text("Genel Kültür").textCase(.none)
        } footer: {
            if viewModel.gkHataMesaji {
                Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                    .foregroundStyle(.red)
            }
        }
    }
    
    private var genelYetenekSection: some View {
        Section {
            Stepper("Doğru Sayisi: \(viewModel.gyDogruSayisi, specifier: "%.0f")",
                    value: $viewModel.gyDogruSayisi,
                    in: 0...(60-viewModel.gyYanlisSayisi))
                .sensoryFeedback(.selection, trigger: viewModel.gyDogruSayisi)
                .bold()
            
            Stepper("Yanlış Sayısı: \(viewModel.gyYanlisSayisi, specifier: "%.0f")",
                    value: $viewModel.gyYanlisSayisi,
                    in: 0...(60-viewModel.gyDogruSayisi))
                .sensoryFeedback(.selection, trigger: viewModel.gyYanlisSayisi)
                .bold()
        } header: {
            Text("Genel Yetenek").textCase(.none)
        } footer: {
            if viewModel.gyHataMesaji {
                Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                    .foregroundStyle(.red)
            }
        }
    }
    
    private var sonucSection: some View {
        Section {
            Text("KPSS Puanı: \(viewModel.sonuc, specifier: "%.3f")")
                .bold()
            
            HesaplaButton(title: "Hesapla") {
                withAnimation {
                    viewModel.hesapla()
                }
            }
            .disabled(viewModel.formKontrol)
            .sensoryFeedback(.selection, trigger: viewModel.sonuc)
        } header: {
            Text("Sonuç").textCase(.none)
        }
    }
}


#Preview {
    OrtaogretimView()
}
