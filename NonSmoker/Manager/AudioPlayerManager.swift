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
    
    func playSound(res: String, format: String) {
        guard let url = Bundle.main.url(forResource: res, withExtension: format) else {
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
