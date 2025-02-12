//
//  SoundModel.swift
//  Boom
//
//  Created by Евгений on 12.02.2025.
//

import Foundation
class BackgroundSoundModel{
    let titel: String
    let formatAudio: String
    init(titel: String, formatAudio: String) {
        self.titel = titel
        self.formatAudio = formatAudio
    }
    static var mocdata: [BackgroundSoundModel] = [
        .init(titel: "backgroundMusicOne", formatAudio: "mp3"),
        .init(titel: "backgroundMusicTwo", formatAudio: "mp3"),
        .init(titel: "backgroundMusicThree", formatAudio: "mp3")]
    
}

class SoundBombTimerMode{
    let titel: String
    let formatAudio: String
    init(titel: String, formatAudio: String) {
        self.titel = titel
        self.formatAudio = formatAudio
    }
    static var mocdata: [SoundBombTimerMode] = [
        .init(titel: "bombTimerOne", formatAudio: "mp3"),
        .init(titel: "bombTimerTwo", formatAudio: "mp3"),
        .init(titel: "bombTimerThree", formatAudio: "mp3")]
    
}
class SoundsBoomModel{
    let titel: String
    let formatAudio: String
    init(titel: String, formatAudio: String) {
        self.titel = titel
        self.formatAudio = formatAudio
    }
    static var mocdata: [SoundsBoomModel] = [
        .init(titel: "boomOne", formatAudio: "mp3"),
        .init(titel: "boomTwo", formatAudio: "mp3"),
        .init(titel: "boomThree", formatAudio: "mp3")]
    
}


//enum SoundsBoomModel: String {
//    case boomOne
//    case boomTwo
//    case boomThree
//    var soundName: String {
//        switch self {
//        case .boomOne : return "boomOne"
//        case .boomTwo: return "boomTwo"
//        case .boomThree: return "boomThree"
//        }
//    }
//}
