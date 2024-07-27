//
//  FontHandler.swift
//  IJokedRestart
//
//  Created by Ahmet Ali ÇETİN on 23.07.2024.
//

import SwiftUI

struct FontHandler {
    
    static func makeFont(_ source: FontHelper.fontType) -> Font {
        switch source {
        case .sansLight10:
            FontHelper.sansLight10
        case .sansLight12:
            FontHelper.sansLight12
        case .sansLight14:
            FontHelper.sansLight14
            
        case .sansRegular8:
            FontHelper.sansRegular8
        case .sansRegular10:
            FontHelper.sansRegular10
        case .sansRegular12:
            FontHelper.sansRegular12
        case .sansRegular15:
            FontHelper.sansRegular15
        case .sansRegular16:
            FontHelper.sansRegular16
        case .sansRegular28:
            FontHelper.sansRegular28
            
        case .sansSemiBold6:
            FontHelper.sansSemiBold6
        case .sansSemiBold8:
            FontHelper.sansSemiBold8
        case .sansSemiBold10:
            FontHelper.sansSemiBold10
        case .sansSemiBold12:
            FontHelper.sansSemiBold12
        case .sansSemiBold14:
            FontHelper.sansSemiBold14
        case .sansSemiBold15:
            FontHelper.sansSemiBold15
        case .sansSemiBold16:
            FontHelper.sansSemiBold16
        case .sansSemiBold20:
            FontHelper.sansSemiBold20
        case .sansSemiBold24:
            FontHelper.sansSemiBold24
        case .sansSemiBold28:
            FontHelper.sansSemiBold28
            
        case .sansBold12:
            FontHelper.sansBold12
        case .sansBold15:
            FontHelper.sansBold15
        case .sansBold16:
            FontHelper.sansBold16
        case .sansBold20:
            FontHelper.sansBold20
        case .sansBold24:
            FontHelper.sansBold24
        case .sansBold28:
            FontHelper.sansBold28
        case .sansBold32:
            FontHelper.sansBold32
        case .sansBold40:
            FontHelper.sansBold40
        case .sansBold56:
            FontHelper.sansBold56
        
        }
    }
    
}

struct FontHelper {
        
    static let sansLight10: Font = .custom("OpenSans-Light", size: 10)
    static let sansLight12: Font = .custom("OpenSans-Light", size: 12)
    static let sansLight14: Font = .custom("OpenSans-Light", size: 14)
    
    static let sansRegular8: Font = .custom("OpenSans-Regular", size: 8)
    static let sansRegular10: Font = .custom("OpenSans-Regular", size: 10)
    static let sansRegular12: Font = .custom("OpenSans-Regular", size: 12)
    static let sansRegular15: Font = .custom("OpenSans-Regular", size: 15)
    static let sansRegular16: Font = .custom("OpenSans-Regular", size: 16)
    static let sansRegular28: Font = .custom("OpenSans-Regular", size: 28)
    
    static let sansSemiBold6: Font = .custom("OpenSans-SemiBold", size: 6)
    static let sansSemiBold8: Font = .custom("OpenSans-SemiBold", size: 8)
    static let sansSemiBold10: Font = .custom("OpenSans-SemiBold", size: 10)
    static let sansSemiBold12: Font = .custom("OpenSans-SemiBold", size: 12)
    static let sansSemiBold14: Font = .custom("OpenSans-SemiBold", size: 14)
    static let sansSemiBold15: Font = .custom("OpenSans-SemiBold", size: 15)
    static let sansSemiBold16: Font = .custom("OpenSans-SemiBold", size: 16)
    static let sansSemiBold20: Font = .custom("OpenSans-SemiBold", size: 20)
    static let sansSemiBold24: Font = .custom("OpenSans-SemiBold", size: 24)
    static let sansSemiBold28: Font = .custom("OpenSans-SemiBold", size: 28)
    
    static let sansBold12: Font = .custom("OpenSans-Bold", size: 12)
    static let sansBold15: Font = .custom("OpenSans-Bold", size: 15)
    static let sansBold16: Font = .custom("OpenSans-Bold", size: 16)
    static let sansBold20: Font = .custom("OpenSans-Bold", size: 20)
    static let sansBold24: Font = .custom("OpenSans-Bold", size: 24)
    static let sansBold28: Font = .custom("OpenSans-Bold", size: 28)
    static let sansBold32: Font = .custom("OpenSans-Bold", size: 32)
    static let sansBold40: Font = .custom("OpenSans-Bold", size: 40)
    static let sansBold56: Font = .custom("OpenSans-Bold", size: 56)
    
    enum fontType {
        case sansLight10
        case sansLight12
        case sansLight14
        
        case sansRegular8
        case sansRegular10
        case sansRegular12
        case sansRegular15
        case sansRegular16
        case sansRegular28
        
        case sansSemiBold6
        case sansSemiBold8
        case sansSemiBold10
        case sansSemiBold12
        case sansSemiBold14
        case sansSemiBold15
        case sansSemiBold16
        case sansSemiBold20
        case sansSemiBold24
        case sansSemiBold28
        
        case sansBold12
        case sansBold15
        case sansBold16
        case sansBold20
        case sansBold24
        case sansBold28
        case sansBold32
        case sansBold40
        case sansBold56
    }
    
}
