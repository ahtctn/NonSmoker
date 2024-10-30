//
//  TimerManager.swift
//  IJokedRestart
//
//  Created by Ahmet Ali ÇETİN on 23.07.2024.
//

import Foundation
import Combine
import UserNotifications

class TimerManager: ObservableObject {
    @Published var elapsedTime: Double = 0.0
    @Published var progressPercentage: Double = 0.0
    private var timer: Timer?
    private var startDate: Date?
    private var lastSavedTime: Double = 0.0
    private let totalYearTime: Double = 365 * 24 * 3600
    
    init() {
        self.lastSavedTime = UserDefaults.standard.double(forKey: "lastSavedTime")
        self.startDate = UserDefaults.standard.object(forKey: "startDate") as? Date
        if let startDate = self.startDate {
            self.elapsedTime = lastSavedTime + Date().timeIntervalSince(startDate)
            updateProgressPercentage()
        } else {
            self.startDate = Date()
            UserDefaults.standard.set(self.startDate, forKey: "startDate")
        }
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            self?.updateElapsedTime()
            self?.checkPassingTime()
        }
    }
    
    func updateProgressPercentage() {
        progressPercentage = min((elapsedTime / totalYearTime) * 100, 100)
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
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
}

extension TimerManager {
    enum PassingTimes {
        case twoHours, sixHours, twelveHours
        case oneDay
        case twoDays
        case threeDays
        case fiveDays
        case oneWeek
        case twoWeeks
        case threeWeeks
        case oneMonth
        case threeMonths
        case sixMonths
        case oneYear
        case twoYears
        case threeYears
        case fiveYears
        case tenYears
        case fifteenYears
    }
    
    func determinePassingTimes() -> PassingTimes? {
        let hours = Int(elapsedTime) / 3600
        let days = hours / 24
        
        switch hours {
        case 2:
            return .twoHours
        case 6:
            return .sixHours
        case 12:
            return .twelveHours
        default:
            switch days {
            case 1:
                return .oneDay
            case 2:
                return .twoDays
            case 3:
                return .threeDays
            case 5:
                return .fiveDays
            case 7:
                return .oneWeek
            case 14:
                return .twoWeeks
            case 21:
                return .threeWeeks
            case 30:
                return .oneMonth
            case 90:
                return .threeMonths
            case 180:
                return .sixMonths
            case 365:
                return .oneYear
            case 730:
                return .twoYears
            case 1095:
                return .threeYears
            case 1825:
                return .fiveYears
            case 3650:
                return .tenYears
            case 5475:
                return .fifteenYears
            default:
                return nil
            }
        }
    }
    
    func checkPassingTime() {
        if let passingTime = determinePassingTimes() {
            scheduleNotification(for: passingTime)
        }
    }
    
    private func scheduleNotification(for passingTime: PassingTimes) {
        var title = ""
        var body = ""
        var triggerTime: TimeInterval = 0
        let hour: TimeInterval = 3600
        let day: TimeInterval = 24 * 3600
        let week: TimeInterval = 7 * day
        let month: TimeInterval = 30 * day
        let year: TimeInterval = 365 * day
        
        switch passingTime {
        case .twoHours:
            title = "🎉 Way to Go!"
            body = "2 hours smoke-free! Keep it up!"
            triggerTime = 2 * hour
        case .sixHours:
            title = "👏 Keep Crushing It!"
            body = "6 hours, nice work! Your lungs are thanking you."
            triggerTime = 6 * hour
        case .twelveHours:
            title = "🌟 You're Awesome!"
            body = "12 hours without smoking. You're awesome!"
            triggerTime = 12 * hour
        case .oneDay:
            title = "💪 One Day Down!"
            body = "1 day smoke-free! You're doing great."
            triggerTime = day
        case .twoDays:
            title = "❤️ Two Days Strong!"
            body = "2 days, amazing! Your heart is happier."
            triggerTime = 2 * day
        case .threeDays:
            title = "👃 Smelling Fresh!"
            body = "3 days smoke-free! Taste and smell improving!"
            triggerTime = 3 * day
        case .fiveDays:
            title = "🙌 Five Days!"
            body = "5 days without a cig! Keep going!"
            triggerTime = 5 * day
        case .oneWeek:
            title = "✨ One Week!"
            body = "1 week smoke-free! Breathing easier, right?"
            triggerTime = week
        case .twoWeeks:
            title = "👍 Two Weeks!"
            body = "2 weeks! Your circulation is better already."
            triggerTime = 2 * week
        case .threeWeeks:
            title = "💥 Three Weeks!"
            body = "3 weeks smoke-free! Getting stronger daily."
            triggerTime = 3 * week
        case .oneMonth:
            title = "🎊 One Month!"
            body = "1 month without smoking! Huge milestone!"
            triggerTime = month
        case .threeMonths:
            title = "🚀 Three Months!"
            body = "3 months, wow! Your lungs are healing."
            triggerTime = 3 * month
        case .sixMonths:
            title = "🎸 Six Months!"
            body = "6 months smoke-free! Keep rocking!"
            triggerTime = 6 * month
        case .oneYear:
            title = "🥳 One Year!"
            body = "1 year, amazing! Half the risk of heart disease!"
            triggerTime = year
        case .twoYears:
            title = "🌟 Two Years!"
            body = "2 years! Still going strong!"
            triggerTime = 2 * year
        case .threeYears:
            title = "🔥 Three Years!"
            body = "3 years smoke-free! You're a legend!"
            triggerTime = 3 * year
        case .fiveYears:
            title = "🏅 Five Years!"
            body = "5 years smoke-free! Stroke risk way down."
            triggerTime = 5 * year
        case .tenYears:
            title = "🎉 Ten Years!"
            body = "10 years, awesome! Lung cancer risk halved."
            triggerTime = 10 * year
        case .fifteenYears:
            title = "🏆 Fifteen Years!"
            body = "15 years smoke-free! Heart disease risk normal."
            triggerTime = 15 * year
        }
        
        NotificationManager.shared.scheduleNotification(title: title, body: body, in: triggerTime)
    }
}
