//
//  SoundModel.swift
//  Boom
//
//  Created by Евгений on 12.02.2025.
//

import Foundation


enum BackgroundSoundModel: String {
    case backgroundOne
    case backgroundTwo
    case backgroundThree
    var soundName: String {
        switch self {
        case .backgroundOne : return "backgroundMusicOne"
        case .backgroundTwo: return "backgroundMusicTwo"
        case .backgroundThree: return "backgroundMusicThree"
        }
    }
}
enum SoundBombTimerModel: String {
    case bombTimerOne
    case bombTimerTwo
    case bombTimerThree
    var soundName: String {
        switch self {
        case .bombTimerOne : return "bombTimerOne"
        case .bombTimerTwo: return "bombTimerTwo"
        case .bombTimerThree: return "bombTimerThree"
        }
    }
}

enum SoundsBoomModel: String {
    case boomOne
    case boomTwo
    case boomThree
    var soundName: String {
        switch self {
        case .boomOne : return "boomOne"
        case .boomTwo: return "boomTwo"
        case .boomThree: return "boomThree"
        }
    }
}
