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
                Stepper("Doğru Sayisi: \(viewModel.gkDogruSayisi, specifier: "%.0f")",
                        value: $viewModel.gkDogruSayisi,
                        in: 0...(60 - viewModel.gkYanlisSayisi))
                    .bold()
                
                Stepper("Yanlış Sayısı: \(viewModel.gkYanlisSayisi,specifier: "%.0f")",
                        value: $viewModel.gkYanlisSayisi,
                        in: 0...(60 - viewModel.gkDogruSayisi))
                    .bold()
            } header: {
                Text("Genel Kültür").textCase(.none)
            } footer: {
                if viewModel.gkHataMesajiGoster {
                    Text(viewModel.hataMesaji)
                        .foregroundStyle(.red)
                }
            }
        }
        
        private var genelYetenekSection: some View {
            Section {
                Stepper("Doğru Sayisi: \(viewModel.gyDogruSayisi,specifier: "%.0f")",
                        value: $viewModel.gyDogruSayisi,
                        in: 0...(60 - viewModel.gyYanlisSayisi))
                    .bold()
                
                Stepper("Yanlış Sayısı: \(viewModel.gyYanlisSayisi,specifier: "%.0f")",
                        value: $viewModel.gyYanlisSayisi,
                        in: 0...(60 - viewModel.gyDogruSayisi))
                    .bold()
            } header: {
                Text("Genel Yetenek").textCase(.none)
            } footer: {
                if viewModel.gyHataMesajiGoster {
                    Text(viewModel.hataMesaji)
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
                        viewModel.hesaplaSonuc()
                    }
                }
                .disabled(viewModel.isFormInvalid)
                .sensoryFeedback(.selection, trigger: viewModel.sonuc)
                
            } header: {
                Text("Sonuç").textCase(.none)
            }
        }
    }
    
#Preview {
    OnlisansView()
}

