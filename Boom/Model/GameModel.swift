//
//  GameModel.swift
//  Boom
//
//  Created by Artem Kriukov on 11.02.2025.
//

import Foundation
import AVFAudio

final class GameModel {
    private var backgroundPlayer: AVAudioPlayer?
    private var bombTimerPlayer: AVAudioPlayer?
    private var isBombSoundPlayed = false
    private var totalTime: Int
    private var secondPassed = 0
    
    private(set) var timer = Timer()
    private(set) var isPaused = false
    
    var onTimerEnd: (() -> Void)?
    
    init(gameTime: TimeModel) {
        switch gameTime {
        case .short:
            self.totalTime = 5
        case .midle:
            self.totalTime = 20
        case .long:
            self.totalTime = 45
        case .random:
            self.totalTime = Int.random(in: 10...45)
        }
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    func pauseOrResumeTimer() {
        isPaused ? startTimer() : timer.invalidate()
        isPaused ? playBombSound() : pauseBombSound()
        isPaused.toggle()
    }
    
    @objc private func updateTimer() {
        if isPaused { return }
        
        if totalTime > 0 {
            totalTime -= 1
            print(totalTime)
        } else {
            stopTimer()
            stopBombSound()
            // Переход на другой экран
            onTimerEnd?()
        }
    }
    
    func createPlayer(soundName: String, loop: Bool) -> AVAudioPlayer? {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return nil }
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = loop ? -1 : 0
            return player
        } catch {
            return nil
        }
    }
    
    func playBackgroundMusic() {
        backgroundPlayer = createPlayer(soundName: Music.backroundMusicThree, loop: true)
        backgroundPlayer?.play()
    }
    
    func stopBackgroundMusic() {
        backgroundPlayer?.stop()
    }
    
    func playBombSound() {
        bombTimerPlayer = createPlayer(soundName: Music.bombTimerOne, loop: true)
        bombTimerPlayer?.play()
    }
    
    func stopBombSound() {
        bombTimerPlayer?.stop()
    }
    
    func pauseBombSound() {
        bombTimerPlayer?.pause()
    }
}

