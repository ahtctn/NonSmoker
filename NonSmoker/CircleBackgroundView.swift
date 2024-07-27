//
//  CircleBackgroundView.swift
//  IJokedRestart
//
//  Created by Ahmet Ali ÇETİN on 23.07.2024.
//

import SwiftUI
import Combine

struct CircleBackgroundView: View {
    
    @State private var cancellables = Set<AnyCancellable>()
    @State private var circleCounter: Int = 0
    private let circleTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let valuesX: [Double]
    let valuesY: [Double]
    let isShowinBackground: Bool
    
    init(circleCounter: Int = 0,
         valuesX: [Double] = [-0.5,-0.3,-0.1,0.1,0.3,0.5,
                               0.5,0.3,0.1,0,-0.1,-0.3,-0.5,
                               -0.5,-0.3,-0.1,0.1,0.3,0.5,
                               0.5,0.3,0.1,0,-0.1,-0.3,-0.5],
         valuesY: [Double] = [1.2,1.1,1.1,1.1,1.1,1.2, /* 6 */
                              1.3,1.4,1.4,1.4,1.4,1.4,1.3, /* 7 */
                              1.2,1.1,1.1,1.1,1.1,1.2,
                              1.3,1.4,1.4,1.4,1.4,1.4,1.3, ],
         isShowinBack: Bool = true ) {
        self.circleCounter = circleCounter
        self.valuesX = valuesX
        self.valuesY = valuesY
        
        self.isShowinBackground = isShowinBack
    }

    
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .opacity(isShowinBackground ? 1 : 0)
            Circle()
                .fill(RadialGradient(colors: [.blue.opacity(0.5), .clear],
                                     center: .center,
                                     startRadius: 0, endRadius: 170))
                .animation(.linear(duration: 1), value: circleCounter)
                .offset(x: moveXCircle() * dynWidth,
                        y: moveYCircle() * dynWidth)
        }
        .ignoresSafeArea()
        .onAppear {
            listenerCircle()
        }
    }
}

#Preview {
    CircleBackgroundView()
}

extension CircleBackgroundView {
    private var background: some View {
        ZStack {
            Color.mint
            Circle()
                .fill(RadialGradient(colors: [.blue.opacity(0.5), .clear],
                                     center: .center,
                                     startRadius: 0, endRadius: 170))
                .animation(.linear(duration: 1), value: circleCounter)
                .offset(x: moveXCircle() * dynWidth,
                        y: moveYCircle() * dynWidth)
        }
        .ignoresSafeArea()
    }
}

extension CircleBackgroundView {
    
    private func listenerCircle() {
        circleTimer
            .receive(on: DispatchQueue.main)
            .sink { [self] timer in
                
                if self.circleCounter < 24 {
                    self.circleCounter += 1
                } else {
                    self.circleCounter = 0
                }
            }
            .store(in: &cancellables)
    }
    
    private func moveXCircle() -> Double {
        

        let index = circleCounter % valuesX.count
        return valuesX[index]
    }

    private func moveYCircle() -> Double {
        
        let index = circleCounter % valuesY.count
        return valuesY[index]
    }
}
