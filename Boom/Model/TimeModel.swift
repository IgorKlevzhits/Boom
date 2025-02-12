//
//  TimeModel.swift
//  Boom
//
//  Created by Игорь Клевжиц on 11.02.2025.
//

enum TimeModel: Int {
    case short
    case midle
    case long
    case random
    var totalTime: Int {
        switch self {
        case .short: return 10
        case .midle: return 20
        case .long: return 45
        case .random: return 10
        }
    }
}
