//
//  QuestionManager.swift
//  Boom
//
//  Created by Игорь Клевжиц on 13.02.2025.
//
import UIKit
import AudioToolbox

final class QuestionManager {
    static let shared = QuestionManager()
    
    private init() {
        loadSelectedCategories()
    }
    
    private var currentQuestions: [String] = []
    private var selectedCategories: [String] = ["О разном"] {
        didSet {
            updateCurrentQuestions()
            saveSelectedCategories()
            print(selectedCategories)
        }
    }
    private var allQuestions: [String: [String]] = [
        "О разном": [
            "Назовите марку машины",
            "Назовите страны, где говорят на русском языке.",
            "Какие профессии существуют в сфере IT?",
            "Назовите африканские страны",
            "Назовите признаки млекопитающего",
            "Какие виды домашних животных вам известны?",
            "Какие существуют виды транспортных средств?",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
        ],
        
        "Спорт и Хобби": [
            "Назовите зимние виды спорта.",
            "Назовите виды спорта, в которых участвуют больше 3-х игроков.",
            "Какие виды спорта наиболее популярны в вашей стране?",
            "Какие виды спорта практикуются в океане?",
            "Назовите виды единоборств.",
            "Какие спортивные дисциплины входят в олимпийские игры?",
            "Какие спортивные тренировки можно делать дома?",
            "Назовите командные виды спорта.",
            "Назовите экстремальные виды спорта",
            "Какие виды спорта подходят для людей всех возрастов?",
            "",
            "",
            "",
            "",
            "Какие виды спорта требуют минимального оборудования?"
        ],

        "Про жизнь": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "Какие книги могут изменить жизнь?",
            "",
            "",
            "",
            "",
            "",
            ""
        ],

        "Знаменитости": [
            "Назовите знаменитых людей, которые изменили историю.",
            "",
            "Какие знаменитости прославились благодаря спорту?",
            "Какие мировые лидеры стали известными благодаря своей работе?",
            "Какие певцы и музыканты прославились в 21 веке?",
            "",
            "",
            "Какие знаменитости стали известными благодаря интернету?",
            "Какие художники признаны мастерами в мире искусства?",
            "Какие писатели стали знаменитыми благодаря своим произведениям?",
            "Какие актеры сыграли культовые роли в кино?",
            "",
            "",
            "",
            ""
        ],

        "Искусство и Кино": [
            "",
            "",
            "Назовите известные картины и их авторов.",
            "Какие фильмы стали культовыми?",
            "Какие режиссеры изменили киноиндустрию?",
            "",
            "",
            "Какие картины вошли в список величайших произведений искусства?",
            "",
            "",
            "Какие актеры являются культовыми в кино?",
            "Какие фильмы номинировались на Оскар за лучший фильм?",
            "",
            "",
            ""
        ],

        "Природа": [
            "",
            "Какие животные находятся под угрозой исчезновения?",
            "",
            "Какие растения могут расти в пустыне?",
            "",
            "Какие существуют виды природных катастроф?",
            "",
            "",
            "",
            "Какие растения используются в медицине?",
            "",
            "",
            "Какие животные живут в Арктике?",
            "",
            ""
        ]
    ]
    
    private func saveSelectedCategories() {
        UserDefaults.standard.set(selectedCategories.isEmpty ? ["О разном"] : selectedCategories, forKey: "selectedCategories")
    }
    
    private func loadSelectedCategories() {
        if let savedCategories = UserDefaults.standard.array(forKey: "selectedCategories") as? [String] {
            selectedCategories = savedCategories
        } else {
            selectedCategories = ["О разном"]
        }
    }
    
    func toggleCategory(_ category: String) {
        if selectedCategories.contains(category) {
            selectedCategories.removeAll { $0 == category }
            AudioServicesPlaySystemSound(1051)
            if SettingsModel.shared.getVibrationState() {
            }
            saveSelectedCategories()
        } else {
            selectedCategories.append(category)
            AudioServicesPlaySystemSound(1052)
            if SettingsModel.shared.getVibrationState() {
            }
            saveSelectedCategories()
        }
    }

    func updateCurrentQuestions() {
        currentQuestions = selectedCategories.flatMap { allQuestions[$0] ?? [] }.shuffled()
    }
    
    func getRandomQuestion() -> String {
        if currentQuestions.isEmpty {
            updateCurrentQuestions()
            return currentQuestions.removeFirst()
        } else {
            return currentQuestions.removeFirst()
        }
        
    }
}
