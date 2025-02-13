//
//  TimeModel.swift
//  Boom
//
//  Created by Игорь Клевжиц on 11.02.2025.
//


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
