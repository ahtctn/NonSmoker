//
//  HeaderView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 27.07.2024.
//

import SwiftUI

struct HeaderView: View {
    var act: () -> ()
    var body: some View {
        HStack {
            Image("no-smoking")
                .resizable()
                .scaledToFit()
                .frame(width: dynWidth * 0.09, height: dynWidth * 0.09)
            Spacer()
            
            Text("NonSmoker")
                .foregroundStyle(.white).bold()
            Spacer()
            
            Button {
                act()
            } label: {
                Image(systemName: "gear")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dynWidth * 0.07, height: dynWidth * 0.07)
                    .foregroundStyle(.white)
            }
        }
        .frame(width: dynWidth * 0.9)
    }
}

#Preview {
    HeaderView(act: {})
}


