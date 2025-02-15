//
//  SoundModel.swift
//  Boom
//
//  Created by Евгений on 12.02.2025.
//

import Foundation

class BackgroundSoundModel {
    static let shared = BackgroundSoundModel()
    
    private init() {}

    private let sounds = ["backgroundMusicOne",
                          "backgroundMusicTwo",
                          "backgroundMusicThree"]
    private let userDefaultsKey = "selectedBackgroundSound"

    func saveSelectedSound(_ index: Int) {
        guard index >= 0 && index < sounds.count else { return }
        UserDefaults.standard.set(sounds[index], forKey: userDefaultsKey)
        print(sounds[index])
    }
    
    func loadSelectedSound() -> String {
        return UserDefaults.standard.string(forKey: userDefaultsKey) ?? sounds[0]
    }
    
    func getCountSounds() -> Int {
        return sounds.count
    }
    
    func getSelectedSoundIndex() -> Int {
        return sounds.firstIndex(of: loadSelectedSound()) ?? 0
    }
}

class SoundBombTimerModel {
    static let shared = SoundBombTimerModel()
    
    private init() {}

    private let sounds = ["bombTimerOne",
                          "bombTimerTwo",
                          "bombTimerThree"]
    private let userDefaultsKey = "selectedBombTimerSound"

    func saveSelectedSound(_ index: Int) {
        guard index >= 0 && index < sounds.count else { return }
        UserDefaults.standard.set(sounds[index], forKey: userDefaultsKey)
        print(sounds[index])
    }
    
    func loadSelectedSound() -> String {
        return UserDefaults.standard.string(forKey: userDefaultsKey) ?? sounds[0]
    }
    
    func getCountSounds() -> Int {
        return sounds.count
    }
    
    func getSelectedSoundIndex() -> Int {
        return sounds.firstIndex(of: loadSelectedSound()) ?? 0
    }
}

class SoundsBoomModel {
    static let shared = SoundsBoomModel()
    
    private init() {}

    private let sounds = ["boomOne",
                          "boomTwo",
                          "boomThree"]
    private let userDefaultsKey = "selectedBoomSound"

    func saveSelectedSound(_ index: Int) {
        guard index >= 0 && index < sounds.count else { return }
        UserDefaults.standard.set(sounds[index], forKey: userDefaultsKey)
        print(sounds[index])
    }
    
    func loadSelectedSound() -> String {
        return UserDefaults.standard.string(forKey: userDefaultsKey) ?? sounds[0]
    }
    
    func getCountSounds() -> Int {
        return sounds.count
    }
    
    func getSelectedSoundIndex() -> Int {
        return sounds.firstIndex(of: loadSelectedSound()) ?? 0
    }
}
