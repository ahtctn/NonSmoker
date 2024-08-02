//
//  HeaderView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 27.07.2024.
//

import SwiftUI

struct HeaderView: View {
    var act: () -> ()
    var knowAct: () -> ()
    var body: some View {
        HStack {
            Image("no-smoking")
                .resizable()
                .scaledToFit()
                .frame(width: dynWidth * 0.06, height: dynWidth * 0.06)
            Spacer()
            
            TopLittleButton("KNOW", i: "book.pages.fill") {
                knowAct()
            }
            
            Button {
                act()
            } label: {
                Image(systemName: "gear")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dynWidth * 0.05, height: dynWidth * 0.05)
                    .foregroundStyle(.white)
            }
        }
        .overlay {
            HStack {
                Spacer()
                
                Text("NonSmoker")
                    .foregroundStyle(.white).bold()
                Spacer()
            }
        }
        .frame(width: dynWidth * 0.9)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        HeaderView(act: {}, knowAct: {})
    }
}


