//
//  SoundModel.swift
//  Boom
//
//  Created by Евгений on 12.02.2025.
//

import Foundation
class BackgroundSoundModel{
    let id: String
    let titel: String
    let formatAudio: String
    init(id: String, titel: String, formatAudio: String) {
        self.id = id
        self.titel = titel
        self.formatAudio = formatAudio
    }
    static var mocdata: [BackgroundSoundModel] = [
        .init(id: "1", titel: "backgroundMusicOne", formatAudio: "mp3"),
        .init(id: "2", titel: "backgroundMusicTwo", formatAudio: "mp3"),
        .init(id: "3", titel: "backgroundMusicThree", formatAudio: "mp3")]
    
}

class SoundBombTimerModel{
    let id: String
    let titel: String
    let formatAudio: String
    init(id: String, titel: String, formatAudio: String) {
        self.id = id
        self.titel = titel
        self.formatAudio = formatAudio
    }
    static var mocdata: [SoundBombTimerModel] = [
        .init(id: "1", titel: "bombTimerOne", formatAudio: "mp3"),
        .init(id: "2", titel: "bombTimerTwo", formatAudio: "mp3"),
        .init(id: "3", titel: "bombTimerThree", formatAudio: "mp3")]
    
}
class SoundsBoomModel{
    let id: String
    let titel: String
    let formatAudio: String
    init(id: String, titel: String, formatAudio: String) {
        self.id = id
        self.titel = titel
        self.formatAudio = formatAudio
    }
    static var mocdata: [SoundsBoomModel] = [
        .init(id: "1", titel: "boomOne", formatAudio: "mp3"),
        .init(id: "2", titel: "boomTwo", formatAudio: "mp3"),
        .init(id: "3", titel: "boomThree", formatAudio: "mp3")]
    
}
