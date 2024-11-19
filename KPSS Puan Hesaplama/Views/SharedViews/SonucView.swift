//
//  SonucView.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 15.08.2024.
//

import SwiftUI

struct SonucView: View {
    
    let sonuc2023:Double
    let EBsonuc2023:Double
    let oabtsonuc2023:Double?
    let oabtsonuc2022:Double?
    let EBsonuc2022:Double
    let sonuc2022:Double
    
    @Environment(\.dismiss) private var dismiss
    
    

    
    var body: some View {
        NavigationStack {
            VStack{
                List{
                    Section{
                        Text("2023 P3 (Memur): \(sonuc2023, specifier: "%.3f")")
                            .bold()
                        Text("2023 P10 (Öğretmen): \(EBsonuc2023, specifier: "%.3f")")
                            .bold()
                        if oabtsonuc2023 != nil{
                            Text("2023 P121 (Alan): \(oabtsonuc2023 ?? 0, specifier: "%.3f")")
                                .bold()
                        }
                    }header: {
                        Text("2023 KPSS")
                            .bold()
                            .foregroundStyle(Color.main)
                    }
                    
                    Section{
                        Text("2022 P3 (Memur): \(sonuc2022, specifier: "%.3f")")
                            .bold()
                        Text("2022 P10 (Öğretmen): \(EBsonuc2022, specifier: "%.3f")")
                            .bold()
                        if oabtsonuc2022 != nil {
                            Text("2022 P121 (Alan): \(oabtsonuc2022 ?? 0, specifier: "%.3f")")
                                .bold()
                        }
                    }header: {
                        Text("2023 KPSS ")
                            .bold()
                            .foregroundStyle(Color.main)
                    }
                }
            }.navigationTitle("Sonuç")
                .toolbar {
                    ToolbarItem{
                        Button("Kapat", systemImage: "xmark"){
                            dismiss()
                        }
                    }
                    
                }
                
        }
    }
}

#Preview {
    SonucView(sonuc2023: 0, EBsonuc2023: 0, oabtsonuc2023: nil, oabtsonuc2022: nil, EBsonuc2022: 0, sonuc2022: 0)
}
