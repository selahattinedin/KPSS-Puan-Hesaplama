//
//  MainView.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 8.08.2024.
//

import SwiftUI


struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List{
                
                    Section{
                        NavigationLink(destination: OrtaogretimView()) {
                            HStack{
                                Image(systemName: "1.circle")
                                    .resizable()
                                    .frame(width: 20 , height: 20)
                                    .foregroundColor(.main)
                                Text("OrtaÖğretim")
                                    .badge(
                                        Text("P94")
                                            .italic()
                                    )
                            }
                        }
                        
                        NavigationLink(destination: OnlisansView()) {
                            HStack{
                                Image(systemName: "2.circle")
                                    .resizable()
                                    .frame(width: 20 , height: 20)
                                    .foregroundColor(.main)
                                Text("Önlisans")
                                    .badge(
                                        Text("P93")
                                            .italic()
                                    )
                            }
                        }
                        
                        NavigationLink(destination: LisansView()) {
                            HStack{
                                Image(systemName: "3.circle")
                                    .resizable()
                                    .frame(width: 20 , height: 20)
                                    .foregroundColor(.main)
                                Text("Lisans (B Grubu)")
                                    .badge(
                                        Text("P3")
                                            .italic()
                                    )
                            }
                        }
                        
                        NavigationLink(destination: EgitimBilimleriView()) {
                            HStack{
                                Image(systemName: "4.circle")
                                    .resizable()
                                    .frame(width: 20 , height: 20)
                                    .foregroundColor(.main)
                                Text("Eğitim Bilimleri")
                                    .badge(
                                        Text("P10")
                                            .italic()
                                    )
                            }
                        }
                        
                        NavigationLink(destination: OABTView()) {
                            HStack{
                                Image(systemName: "5.circle")
                                    .resizable()
                                    .frame(width: 20 , height: 20)
                                    .foregroundColor(.main)
                                Text("ÖABT")
                                    .badge(
                                        Text("P121")
                                            .italic()
                                    )
                            }
                        }
                        
                    } header: {
                        Text("Bölüm Seçiniz")
                            .textCase(.none)
                            
                    }
                }
            }
            .navigationTitle("KPSS Puan Hesaplama")
        }
    }
}

#Preview {
    MainView()
}
