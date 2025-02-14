//
//  SettingsModel.swift
//  Boom
//
//  Created by Игорь Клевжиц on 14.02.2025.
//
import Foundation

class SettingsModel {
    static let shared = SettingsModel()
    
    private let modeKey = "mode"
    private let vibrationKey = "vibration"
    private let challengeKey = "task"
    
    func getModeState() -> Bool {
        return UserDefaults.standard.bool(forKey: modeKey)
    }
    
    func setModeState(_ state: Bool) {
        UserDefaults.standard.set(state, forKey: modeKey)
    }
    
    func getVibrationState() -> Bool {
        return UserDefaults.standard.bool(forKey: vibrationKey)
    }
    
    func setVibrationState(_ state: Bool) {
        UserDefaults.standard.set(state, forKey: vibrationKey)
    }
    
    func getChallengeState() -> Bool {
        return UserDefaults.standard.bool(forKey: challengeKey)
    }
    
    func setChallengeState(_ state: Bool) {
        UserDefaults.standard.set(state, forKey: challengeKey)
    }
}
