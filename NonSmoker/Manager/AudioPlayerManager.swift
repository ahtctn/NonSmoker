//
//  AudioPlayerManager.swift
//  IJokedRestart
//
//  Created by Ahmet Ali ÇETİN on 23.07.2024.
//

import Foundation
import AVFoundation

class AudioPlayerManager {
    private var audioPlayer: AVAudioPlayer?
    static let shared = AudioPlayerManager()
    private init () {}
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "laugh", withExtension: "mp3") else {
            print("Sound file not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
