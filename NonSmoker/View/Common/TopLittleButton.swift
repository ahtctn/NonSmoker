//
//  TopLittleButton.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 2.08.2024.
//

import SwiftUI

struct TopLittleButton: View {
    
    let text: String
    let icon: String
    let action: () -> ()
    
    init(_ text: String,
         i icon: String,
         action: @escaping () -> ()) {
        self.text = text
        self.icon = icon
        self.action = action
    }
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 11)).bold()
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: dynWidth * 0.05, height: dynHeight * 0.02)
                .padding(.vertical,3)
                .foregroundStyle(.yellow)
        }
        .frame(height: dynHeight * 0.03)
        .onTapGesture(perform: {
            action()
            print("22")
        })
        .background(
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.black.opacity(0.7))
                .padding(.init(top: -2, leading: -10, bottom: -2, trailing: -10))
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.yellow)
                        .padding(.init(top: -2, leading: -10, bottom: -2, trailing: -10))
                )
        )
        
        .padding(.horizontal,10)
     
    }
}

#Preview {
    ZStack {
        Color.black
        TopLittleButton("GET MOTIVATE", i: "book.pages.fill") { }
    }
}
