//
//  OABTView.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 8.08.2024.
//

import SwiftUI

struct OABTView: View {

        @StateObject private var viewModel = EgitimBilimleriViewModel()
        
        var body: some View {
            NavigationStack {
                Form {
                    genelKulturSection
                    genelYetenekSection
                    egitimBilimleriSection
                }
                .navigationTitle("Eğitim Bilimleri")
            }
        }
        
        private var genelKulturSection: some View {
            Section {
                Stepper("Doğru Sayisi: \(viewModel.gkDogruSayisi, specifier: "%.0f")",
                        value: $viewModel.gkDogruSayisi,
                        in: 0...(60-viewModel.gkYanlisSayisi))
                    .bold()
                    .sensoryFeedback(.selection, trigger: viewModel.gkDogruSayisi)
                
                Stepper("Yanlış Sayısı: \(viewModel.gkYanlisSayisi, specifier: "%.0f")",
                        value: $viewModel.gkYanlisSayisi,
                        in: 0...(60-viewModel.gkDogruSayisi))
                    .bold()
                    .sensoryFeedback(.selection, trigger: viewModel.gkYanlisSayisi)
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
                    .bold()
                    .sensoryFeedback(.selection, trigger: viewModel.gyDogruSayisi)
                
                Stepper("Yanlış Sayısı: \(viewModel.gyYanlisSayisi, specifier: "%.0f")",
                        value: $viewModel.gyYanlisSayisi,
                        in: 0...(60-viewModel.gyDogruSayisi))
                    .bold()
                    .sensoryFeedback(.selection, trigger: viewModel.gyYanlisSayisi)
            } header: {
                Text("Genel Yetenek").textCase(.none)
            } footer: {
                if viewModel.gyHataMesaji {
                    Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                        .foregroundStyle(.red)
                }
            }
        }
        
        private var egitimBilimleriSection: some View {
            Section {
                StepperView(title: "Doğru Sayisi",
                           value: $viewModel.ebDogruSayisi,
                           maxValue: 80-viewModel.ebYanlisSayisi)
                
                StepperView(title: "Yanlış Sayısı",
                           value: $viewModel.ebYanlisSayisi,
                           maxValue: 80-viewModel.ebDogruSayisi)
                
                HesaplaButton(title: "Hesapla") {
                    withAnimation {
                        viewModel.hesaplaSonuc()
                    }
                }
                .disabled(viewModel.formKontrol)
                .sensoryFeedback(.selection, trigger: viewModel.sonuc2022)
                .sheet(isPresented: $viewModel.isShowingSheet) {
                    SonucView(sonuc2023: viewModel.sonuc2023,
                             EBsonuc2023: viewModel.EBsonuc2023,
                             oabtsonuc2023: nil,
                             oabtsonuc2022: nil,
                             EBsonuc2022: viewModel.EBsonuc2022,
                             sonuc2022: viewModel.EBsonuc2022)
                }
            } header: {
                Text("Eğitim Bilimleri").textCase(.none)
            } footer: {
                if viewModel.ebHataMesaji {
                    Text("Toplam doğru ve yanlış sayıları 80'ı geçemez.")
                        .foregroundStyle(.red)
                }
            }
        }
    }

    struct StepperView: View {
        let title: String
        @Binding var value: Double
        let maxValue: Double
        
        var body: some View {
            Stepper("\(title): \(value, specifier: "%.0f")",
                    value: $value,
                    in: 0...maxValue)
                .bold()
                .sensoryFeedback(.selection, trigger: value)
        }
    }
    
#Preview {
    OABTView()
}
