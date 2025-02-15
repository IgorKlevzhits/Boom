//
//  TimeModel.swift
//  Boom
//
//  Created by Игорь Клевжиц on 11.02.2025.
//


import Foundation

class TimeModel {
    static let shared = TimeModel()
    
    private init() {}
    enum TimeOption: Int, CaseIterable {
        case short = 10
        case middle = 20
        case long = 45
        case random
    }
    
    private let userDefaultsKey = "selectedTime"
    
    func saveSelectedTime(_ option: TimeOption) {
        UserDefaults.standard.set(option.rawValue, forKey: userDefaultsKey)
    }
    
    func loadSelectedTime() -> TimeOption {
        let savedValue = UserDefaults.standard.integer(forKey: userDefaultsKey)
        return TimeOption(rawValue: savedValue) ?? .short
    }
    
    func getTotalTime() -> Int {
        let selectedOption = loadSelectedTime()
        if SettingsModel.shared.getModeState() {
            return selectedOption == .random ? Int.random(in: 10...45) : selectedOption.rawValue
        } else {
            switch selectedOption {
            case .short:
                return 5
            case .middle:
                return 7
            case .long:
                return 10
            default:
                return Int.random(in: 5...10)
            }
        }
    }
}

