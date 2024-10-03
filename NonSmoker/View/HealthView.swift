//
//  HealthView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 28.07.2024.
//

import SwiftUI

struct HealthView: View {
    @EnvironmentObject var viewModel: HealthViewModel
    @EnvironmentObject var mainVM: MainViewModel
    
    
    var body: some View {
        ZStack {
            ConstantColors.baseColor.ignoresSafeArea(.all)
            VStack {
                HeaderView {
                    withAnimation(.smooth) {
                        mainVM.activePopup = .know
                    }
                } settingsAct: {
                    withAnimation(.smooth) {
                        mainVM.activeSheet = .settings
                    }
                }
            
                
                ScrollView(.vertical) {
                    ForEach(viewModel.healthTypes, id: \.name) { type in
                        HStack {
                            HealthSectionHeaderView(model: type)
                            
                        }
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(viewModel.health, id: \.id) { health in
                                    if health.healthType.id == type.id {
                                        HealthCellView(model: health) {
                                            viewModel.selectedCell = health
                                            mainVM.activeSheet = .health
                                        }
                                    }
                                }
                            }
                            .padding([.leading, .trailing], dynWidth * 0.05)
                        }
                        .overlay {
                            VStack {
                                HStack {
                                    Spacer()
                                    if type.id == 0 {
                                        MainHealthSectionView(perc: .constant(11), width: dynWidth * 0.2, height: dynWidth * 0.2, stroke: 6)
                                    }
                                }
                                Spacer()
                            }
                            .padding(.top, dynWidth * 0.01)
                            .padding(.trailing, dynWidth * 0.02)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HealthView()
        .environmentObject(MainViewModel())
}

struct HealthSectionHeaderView: View {
    var model: HealthTypeModel
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(.yellow)
                .frame(width: dynWidth * 0.5, height: dynWidth * 0.1006)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.black, lineWidth: 6)
                        .overlay {
                            HStack {
                                Text("\(model.name) \(model.emoj)")
                                    .bold()
                                    .font(.system(size: 18))
                                    .padding(.leading, dynWidth * 0.021)
                                Spacer()
                            }
                        }
                    
                }
                .padding([.top], dynWidth * 0.05333)
                .padding(.leading, dynWidth * 0.05)
            Spacer()
        }
    }
}
