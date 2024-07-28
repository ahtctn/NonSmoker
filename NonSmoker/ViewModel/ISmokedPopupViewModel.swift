//
//  ISmokedPopupViewModel.swift
//  NonSmoker
//
//  Created by Ahmet Ali ÇETİN on 28.07.2024.
//

import Foundation

class ISmokedPopupViewModel: ObservableObject {
    func getRandomMotivationalQuote() -> String {
        let quotes: [String] = [
            "Every step forward, even small ones, is progress.",
            "It's okay to stumble; what's important is getting back on track.",
            "Remember your reasons for quitting and stay focused on them.",
            "Each day without smoking is a victory.",
            "Forgive yourself for slip-ups and keep moving forward.",
            "You are stronger than your cravings.",
            "Believe in yourself and your ability to quit.",
            "Your health and well-being are worth the effort.",
            "Each time you resist a cigarette, you're one step closer to freedom.",
            "Mistakes are part of the journey; learn from them and continue.",
            "Think of how far you've already come.",
            "You have the power to overcome this challenge.",
            "Picture the healthier, smoke-free future you're working towards.",
            "Your determination can conquer any setback.",
            "Each moment you stay smoke-free, you’re healing your body.",
            "Celebrate your successes, no matter how small.",
            "You are not alone; many have quit successfully and so can you.",
            "Keep your goal in sight and never give up.",
            "You have the strength within you to quit smoking.",
            "Today is a new opportunity to make healthier choices.",
        ]
        
        return quotes.randomElement() ?? "Stay strong, you can do it!"
    }
    
    func getRandomMotivationalTitle() -> String {
        let titles: [String] = [
            "Embrace New Beginnings",
            "Stay Motivated, Stay Strong",
            "Your Journey to Health",
            "One Step at a Time",
            "Overcoming Challenges",
            "Believe in Yourself",
            "Celebrate Small Wins",
            "You Can Do This",
            "Every Day is a Victory",
            "Keep Pushing Forward",
            "Your Health Matters",
            "Stronger Every Day",
            "A Brighter Future Awaits",
            "Stay Focused on Your Goals",
            "Your Strength is Incredible",
            "You Are Not Alone",
            "Determination Leads to Success",
            "Visualize Your Success",
            "Make Today Count",
            "Never Give Up"
        ]
        return titles.randomElement() ?? "Let's start again"
    }
}
