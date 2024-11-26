//
//  EgitimbilimleriView.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 8.08.2024.
//

import SwiftUI

struct EgitimBilimleriView: View {
    @StateObject private var viewModel = EgitimBilimleriViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                generalKnowledgeSection
                generalAbilitySection
                educationSciencesSection
            }
            .navigationTitle("Eğitim Bilimleri")
        }
    }
    
    private var generalKnowledgeSection: some View {
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
            if viewModel.gkDogruSayisi + viewModel.gkYanlisSayisi > 60 {
                Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                    .foregroundStyle(.red)
            }
        }
    }
    
    private var generalAbilitySection: some View {
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
            if viewModel.gyDogruSayisi + viewModel.gyYanlisSayisi > 60 {
                Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                    .foregroundStyle(.red)
            }
        }
    }
    
    private var educationSciencesSection: some View {
        Section {
            Stepper("Doğru Sayisi: \(viewModel.ebDogruSayisi, specifier: "%.0f")",
                    value: $viewModel.ebDogruSayisi,
                    in: 0...(80-viewModel.ebYanlisSayisi))
                .sensoryFeedback(.selection, trigger: viewModel.ebDogruSayisi)
                .bold()
            
            Stepper("Yanlış Sayısı: \(viewModel.ebYanlisSayisi, specifier: "%.0f")",
                    value: $viewModel.ebYanlisSayisi,
                    in: 0...(80-viewModel.ebDogruSayisi))
                .sensoryFeedback(.selection, trigger: viewModel.ebYanlisSayisi)
                .bold()
            
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
            if viewModel.ebDogruSayisi + viewModel.ebYanlisSayisi > 80 {
                Text("Toplam doğru ve yanlış sayıları 80'ı geçemez.")
                    .foregroundStyle(.red)
            }
        }
    }
}
#Preview {
    EgitimBilimleriView()
}
