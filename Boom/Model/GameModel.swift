//
//  GameModel.swift
//  Boom
//
//  Created by Artem Kriukov on 11.02.2025.
//

import AVFAudio
import UIKit

final class GameModel {
    static var backgroundPlayer: AVAudioPlayer?
    static var bombTimerPlayer: AVAudioPlayer?
    static var boomPlayer: AVAudioPlayer?
    private var isBombSoundPlayed = false
    private var totalTime: Int
    private var secondPassed = 0
    
    private(set) var timer = Timer()
    private(set) var isPaused = false
    
    var onTimerEnd: (() -> Void)?
    var onAnimationChange: (() -> Void)?
    
    init() {
        if SettingsModel.shared.getModeState() {
            totalTime = TimeModel.shared.getTotalTime()
        } else {
            totalTime = TimeModel.shared.getTotalTime()
        }
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    private func stopTimer() {
        timer.invalidate()
    }
    
    func pauseOrResumeTimer() {
        isPaused ? startTimer() : timer.invalidate()
        isPaused ? playBombTimerSound() : pauseBombTimerSound()
        isPaused.toggle()
    }
    
    @objc private func updateTimer() {
        if isPaused { return }
        switch totalTime {
        case 1:
            totalTime -= 1
            stopBombTimerSound()
            playBoom()
            if SettingsModel.shared.getVibrationState() {
                boomVibration()
            }
            
            onAnimationChange?()
        case 0:
            stopTimer()
            // Переход на другой экран
            onTimerEnd?()
        default:
            totalTime -= 1
            print(totalTime)
        }
    }
    
    func createPlayer(soundName: String, loop: Bool) -> AVAudioPlayer? {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return nil }
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = loop ? -1 : 0
            return player
        } catch {
            print("ошибка \(soundName)")
            return nil
        }
    }
    
    private func boomVibration() {
        let impact = UIImpactFeedbackGenerator(style: .heavy)
        let notification = UINotificationFeedbackGenerator()
        
        impact.impactOccurred()
        notification.notificationOccurred(.error)
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        
        for i in 0..<5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + (0.1 * Double(i))) {
                impact.impactOccurred()
            }
        }
    }
    
    private func playBoom() {
        guard !isSilentMode() else { return }
        GameModel.boomPlayer = createPlayer(soundName: SoundsBoomModel.shared.loadSelectedSound(), loop: false)
        GameModel.boomPlayer?.play()
    }
    
    func playBackgroundMusic() {
        guard !isSilentMode() else { return }
        GameModel.backgroundPlayer = createPlayer(soundName: BackgroundSoundModel.shared.loadSelectedSound(), loop: true)
        GameModel.backgroundPlayer?.play()
    }
    
    func stopBackgroundMusic() {
        GameModel.backgroundPlayer?.stop()
    }
    
    func playBombTimerSound() {
        guard !isSilentMode() else { return }
        GameModel.bombTimerPlayer = createPlayer(soundName: SoundBombTimerModel.shared.loadSelectedSound(), loop: true)
        GameModel.bombTimerPlayer?.play()
    }
    
    func stopBombTimerSound() {
        GameModel.bombTimerPlayer?.stop()
    }
    
    private func pauseBombTimerSound() {
        GameModel.bombTimerPlayer?.pause()
    }
    
    func updateTime() {
        totalTime = TimeModel.shared.getTotalTime()
    }
    
    private func isSilentMode() -> Bool {
        return AVAudioSession.sharedInstance().secondaryAudioShouldBeSilencedHint
    }
}
