//
//  HealthView.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 28.07.2024.
//

import SwiftUI

struct HealthView: View {
    @StateObject var viewModel: HealthViewModel = HealthViewModel()
    @EnvironmentObject var mainVM: MainViewModel
    @State private var selectedCell: HealthModel? = nil
    @State private var activeSheet: ActiveSheet? = nil
    
    var body: some View {
        ZStack {
            ConstantColors.baseColor.ignoresSafeArea(.all)
            VStack {
                HeaderView {
                    print("Settings Button Tapped")
                } knowAct: {
                    withAnimation(.smooth) {
                        mainVM.activePopup = .know
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
                                            selectedCell = health
                                            activeSheet = .health
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
                                        MainHealthSectionView(perc: .constant(81), width: dynWidth * 0.2, height: dynWidth * 0.2)
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
            
            .sheet(item: $activeSheet) { _ in
                switch activeSheet {
                case .achievement:
                    EmptyView()
                case .health:
                    if let cell = selectedCell {
                        HealthSheetView(model: cell) {
                            activeSheet = nil
                            selectedCell = nil
                        }
                        .modifier(BottomSheetModifier(0.5))
                    }
                default:
                    EmptyView()
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
