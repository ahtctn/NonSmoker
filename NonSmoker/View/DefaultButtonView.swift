//
//  DefaultButtonView.swift
//  IJokedRestart
//
//  Created by Ahmet Ali ÇETİN on 23.07.2024.
//

import SwiftUI
//MARK: - DefaultButtonView - View -
struct DefaultButtonView: View {
    
    let isLotify: Bool
    let isBlued: Bool
    let isCreationAllowed: Bool
    let isGenerationCountLowerThanFive: Bool
    let isPlayButton: Bool
    let isOnboardingButton: Bool
    let width: CGFloat
    let height: CGFloat
    
    let firstColor: String
    let secondColor: String
    let title: String
    let action: () -> ()
    
    init(isBlued: Bool = true,
         isCreationAllowed: Bool = true,
         isGenerationCountLowerThanFive: Bool = true,
         isLotify: Bool = false,
         isPlayButton: Bool = false ,
         isOnboard isOnboardingButton: Bool = false,
         width: CGFloat = 0.9,
         height: CGFloat = 0.07,
         
         fColor firstColor: String = "#587BF6",
         sColor secondColor: String = "#2C58F3",
         _ title: String,
         
         action: @escaping () -> Void) {
        self.isBlued = isBlued
        self.isCreationAllowed = isCreationAllowed
        self.isGenerationCountLowerThanFive = isGenerationCountLowerThanFive
        self.isLotify = isLotify
        self.isOnboardingButton = isOnboardingButton
        self.isPlayButton = isPlayButton
        
        self.width = width
        self.height = height
        
        self.firstColor = firstColor
        self.secondColor = secondColor
        self.title = title
        
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            RoundedRectangle(cornerRadius: 30)
                .fill(backgroundColor)
                .frame(width: dynWidth * width,
                       height: dynHeight * height)
                .overlay {
                    onBackgroundView
                }
        })
    }
}
//MARK: - DefaultButtonView - Preview -
#Preview {
    DefaultButtonView(isBlued: true,
                      isPlayButton: true,
                      isOnboard: false,
                      "Continue") { }
}
//MARK: - DefaultButtonView - extension - view -
extension DefaultButtonView {
    
    private var backgroundColor: LinearGradient {
        LinearGradient(stops: [.init(color: Color.blue,
                                     location: 0),
                               .init(color: Color.mint,
                                     location: 1)],
                       startPoint: .leading,
                       endPoint: .trailing)
    }
    
    private var onBackgroundView: some View {
        ZStack {
            HStack {
                Spacer()
                if isPlayButton {
                    Image("playIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: dynWidth * 0.03)
                        .padding(.trailing,20)
                }
                Text(title)
                    .foregroundStyle(.white)
                    .font(FontHandler.makeFont(.sansSemiBold16))
                    .padding(.trailing,isPlayButton ? 20 : 0)
                
                Spacer()
            }
            HStack {
                Spacer()
                if isLotify {
                    Image(systemName: "bell")
                        .foregroundStyle(.white)
                        .scaledToFit()
                        .frame(width: dynWidth * 0.06)
                        .offset(x:  dynWidth * -0.28)
                }
                if isOnboardingButton {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                }
            }
        }
    }
}
