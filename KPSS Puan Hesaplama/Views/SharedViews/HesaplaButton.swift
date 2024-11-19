//
//  HesaplaButton.swift
//  KPSS Puan Hesaplama
//
//  Created by Selahattin EDİN on 10.08.2024.
//

import SwiftUI

struct HesaplaButton: View {
    
    let title : String
    let action : () -> Void
    var body: some View {
        
        
        Button(action: {
            action()
        }, label: {
            Label(title, systemImage: "plus.forwardslash.minus")
                .font(.title)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
            
        })
        .buttonStyle(.borderedProminent)
        .tint(.main)
       
    }
}

#Preview {
    HesaplaButton(title: "Hesapla", action: {
        print("sss")
    })
}
