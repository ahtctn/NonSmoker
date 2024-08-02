//
//  XMarkView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 2.08.2024.
//

import SwiftUI

struct XMarkView: View {
    
    let width: CGFloat
    var action: () -> Void
    
    init(width: CGFloat = 0.08,
         action: @escaping () -> Void) {
        self.width = width
        self.action = action
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: action) {
                    Image(systemName: "x.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        
                        .opacity(0.5)
                        .frame(width: dynWidth * width)
                        .padding(.trailing, 35)

                }
            }
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        Color.black
        XMarkView {
            
        }
    }
}
