//
//  NonSmokerApp.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 27.07.2024.
//

import SwiftUI

@main
struct NonSmokerApp: App {
    @StateObject var mainViewModel: MainViewModel = MainViewModel()
    
    init() {
        print("NonSmokerApp init called")
        let notificationManager = NotificationManager.shared
        notificationManager.requestAuthorization()
        UNUserNotificationCenter.current().delegate = notificationManager
    }
    
    var body: some Scene {
        WindowGroup {
            HomeDelegate()
                .environmentObject(mainViewModel)
            
        }
    }
}
