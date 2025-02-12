//
//  TimeModel.swift
//  Boom
//
//  Created by Игорь Клевжиц on 11.02.2025.
//

//enum TimeModel: Int {
//    case short
//    case midle
//    case long
//    case random
//    var totalTime: Int {
//        switch self {
//        case .short: return 10
//        case .midle: return 20
//        case .long: return 45
//        case .random: return 10
//        }
//    }
//}


class TimeModel{
    let titel: String
    let totalTime: Int
    init(titel: String, totalTime: Int) {
        self.titel = titel
        self.totalTime = totalTime
    }
    static var mocdata: [TimeModel] = [
        .init(titel: "short", totalTime: 10),
        .init(titel: "midle", totalTime: 20),
        .init(titel: "long", totalTime: 45)]
}
