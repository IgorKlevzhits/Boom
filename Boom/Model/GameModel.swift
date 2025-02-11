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
    private var totalTime = 15
    private var secondPassed = 0
    
    private(set) var timer = Timer()
    private(set) var isPaused = false
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    func pauseOrResumeTimer() {
        if isPaused {
            startTimer()
        } else {
            timer.invalidate()
        }
        isPaused.toggle()
    }
    
    @objc private func updateTimer() {
        if isPaused { return }
        
        if totalTime == 4 {
            bombSoundPlayed()
        }
        
        if totalTime > 0 {
            totalTime -= 1
            print(totalTime)
        } else {
            stopTimer()
            // Переход на другой экран
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
    
    func bombSoundPlayed() {
        bombTimerPlayer = createPlayer(soundName: Music.bombTimer, loop: false)
        bombTimerPlayer?.play()
    }
}

