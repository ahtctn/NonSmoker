//
//  TimerManager.swift
//  IJokedRestart
//
//  Created by Ahmet Ali ÇETİN on 23.07.2024.
//

import Foundation
import Combine

class TimerManager: ObservableObject {
    @Published var elapsedTime: Double = 0.0
    private var timer: Timer?
    private var startDate: Date?
    private var lastSavedTime: Double = 0.0

    init() {
        self.lastSavedTime = UserDefaults.standard.double(forKey: "lastSavedTime")
        self.startDate = UserDefaults.standard.object(forKey: "startDate") as? Date
        if let startDate = self.startDate {
            self.elapsedTime = lastSavedTime + Date().timeIntervalSince(startDate)
        } else {
            self.startDate = Date()
            UserDefaults.standard.set(self.startDate, forKey: "startDate")
        }
        startTimer()
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.00001, repeats: true) { [weak self] _ in
            self?.updateElapsedTime()
        }
    }

    func updateElapsedTime() {
        if let startDate = startDate {
            elapsedTime = lastSavedTime + Date().timeIntervalSince(startDate)
        }
    }

    func resetTimer() {
        startDate = Date()
        lastSavedTime = 0.0
        elapsedTime = 0.0
        UserDefaults.standard.set(startDate, forKey: "startDate")
        UserDefaults.standard.set(lastSavedTime, forKey: "lastSavedTime")
    }

    deinit {
        timer?.invalidate()
        timer = nil
    }
}
