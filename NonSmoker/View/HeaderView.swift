//
//  HeaderView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 27.07.2024.
//

import SwiftUI

struct HeaderView: View {
    var knowAct: () -> ()
    var settingsAct: () -> ()
    var body: some View {
        HStack {
            TopLittleButton("KNOW", i: "book.pages.fill") {
                knowAct()
            }
            
            Spacer()
            Button {
                settingsAct()
            } label: {
                Image(systemName: "gear")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dynWidth * 0.05, height: dynWidth * 0.05)
                    .foregroundStyle(.yellow)
            }
        }
        .overlay {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 2)
                    .fill(.white)
                    .frame(width: dynWidth * 0.3)
                    .overlay {
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(.black ,lineWidth: 4)
                            .overlay {
                                Text("Smoke-Free")
                                    .foregroundStyle(.black)
                                    .bold()
                            }
                    }
                
                Spacer()
            }
        }
        .frame(width: dynWidth * 0.9)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        HeaderView(knowAct: {}, settingsAct: {})
    }
}


