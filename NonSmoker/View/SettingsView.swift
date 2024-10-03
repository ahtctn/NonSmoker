//
//  SettingsView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 2.10.2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    var body: some View {
        ZStack {
            Color("base2").ignoresSafeArea(.all)
            VStack {
                headerView
                    .padding(.top, dynWidth * 0.133333333333)
                Spacer()
                VStack(spacing: 20) {
                    DefaultButtonView("I Smoked, Restart") {
                        mainViewModel.activeSheet = nil
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                            mainViewModel.activePopup = .smokedRestart
                        }
                    }
                    DefaultButtonView("Rate Us") {
                        RateHelper.rateUs { success in
                            if success {
                                print("Rate showed to the user. ⭐️")
                            }
                        }
                    }
                    
                    DefaultButtonView("Offer A Feature") {
                        
                    }
                    
                    DefaultButtonView("Invite A Friend") {
                        
                    }
                    
                    DefaultButtonView("Get Support") {
                        
                    }
                    
                    
                }
                Spacer()
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            Spacer()
            RoundedRectangle(cornerRadius: 2)
                .fill(.white)
                .frame(width: dynWidth * 0.3, height: dynWidth * 0.08)
                .overlay {
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.black ,lineWidth: 4)
                        .overlay {
                            Text("Settings")
                                .foregroundStyle(.black)
                                .bold()
                        }
                }
            
            Spacer()
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(MainViewModel())
}


import SwiftUI
import StoreKit

class RateHelper {
    static func rateUs(result: @escaping (Bool) -> ()) {
        DispatchQueue.main.async {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {result(false); return }
            SKStoreReviewController.requestReview(in: windowScene)
            result(true)
        }
    }
}
