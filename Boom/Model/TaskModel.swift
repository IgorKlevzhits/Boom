//
//  TaskModel.swift
//  Boom
//
//  Created by Евгений on 11.02.2025.
//

import Foundation
class TaskModel {
    
    static let shared = TaskModel()
    
    init() {
        updateTasks()
    }
    
    private let tasks: [String] = [
        "Замри в позе скульптуры на две минуты",
        "Скажи комплимент любым двум участникам",
        "Разговаривай с акцентом следующие два круга",
        "Напой любую песеню без слов, пусть другие участники угадают ее",
        "Отвечай следующие пару минут, как робот",
        "Расскажи удивительный факт о себе",
        "Исполнить танец маленьких гусят",
        "Разговаривай как Жириновский следующие два круга",
        "Ухаживать за другим игроком один круг",
        "Изобразить Филиппа Киркорова",
        "Играть следующий круг с закрытыми глазами",
        "Притвориться Лениным",
        "Расскажи анекдот",
        "Следующий круг комментируй ответ каждого участника кому-нибудь на ушко",
        "Придумай задание другому игроку"
    ]
    private var currentTasks: [String] = []
    
    private func updateTasks() {
        currentTasks = tasks.shuffled()
    }
    
    func getTask() -> String {
        if currentTasks.isEmpty {
            updateTasks()
            return currentTasks.removeFirst()
        } else {
            return currentTasks.removeFirst()
        }
    }
}
