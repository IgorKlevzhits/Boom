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
//            print(selectedCategories)
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
            "Какие известные музыкальные жанры существуют?",
            "Какие страны находятся на территории Южной Америки?",
            "Какие элементы являются благородными газами?",
            "Какой континент считается родиной пингвинов?",
            "Какой музыкальный инструмент имеет клавиши и струны и часто используется в классической музыке?",
            "Какие виды спорта входят в программу Олимпийских игр?",
            "Какие планеты в нашей солнечной системе имеют кольца?",
            "Какой музыкальный инструмент имеет клавиши и струны и часто используется в классической музыке?",
            "Какие страны являются членами Европейского Союза?"
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
            "Какие известные спортсмены стали тренерами после завершения карьеры?",
            "Какие виды спорта включают в себя элементы стратегии?",
            "Какие известные спортивные события проходят ежегодно?",
            "Какие известные спортсмены стали лицами брендов?",
            "Какие виды спорта требуют минимального оборудования?"
        ],
        
        "Про жизнь": [
            "Какие навыки полезны для успешной карьеры?",
            "Какие способы поддержания эмоционального здоровья существуют?",
            "Какой философский вопрос касается смысла жизни и существования?",
            "Какие виды отношений существуют между людьми?",
            "Какие виды волонтерской деятельности существуют?",
            "Какие виды искусства могут обогащать жизнь?",
            "Какие способы поддержания здоровья существуют?",
            "Какие виды путешествий могут обогатить жизненный опыт?",
            "Какие книги могут изменить жизнь?",
            "Какой процесс включает в себя принятие решений и выбор жизненного пути?",
            "Какие способы выражения благодарности существуют?",
            "Какие способы самосовершенствования существуют?",
            "Какой фактор считается ключевым для поддержания здоровых отношений между людьми?",
            "Какие привычки способствуют улучшению качества жизни?",
            "Какие виды досуга популярны среди людей?"
        ],
        
        "Знаменитости": [
            "Назовите знаменитых людей, которые изменили историю.",
            "Какие актеры и актрисы стали известными благодаря своим театральным работам?",
            "Какие знаменитости прославились благодаря спорту?",
            "Какие мировые лидеры стали известными благодаря своей работе?",
            "Какие певцы и музыканты прославились в 21 веке?",
            "Какие знаменитости стали известными благодаря своим ролям в анимационных фильмах?",
            "Какие знаменитости были участниками реалити-шоу?",
            "Какие знаменитости стали известными благодаря интернету?",
            "Какие художники признаны мастерами в мире искусства?",
            "Какие писатели стали знаменитыми благодаря своим произведениям?",
            "Какие актеры сыграли культовые роли в кино?",
            "Какие знаменитости активно ведут свои блоги или влоги?",
            "Какие актеры получили Золотой глобус за лучшую женскую роль?",
            "Какие музыканты известны своими хитами?",
            "Какие актрисы стали иконами стиля?"
        ],
        
        "Искусство и Кино": [
            "Какие известные театральные пьесы написаны Уильямом Шекспиром?",
            "Какие фильмы были сняты в черно-белом формате и стали классикой?",
            "Назовите известные картины и их авторов.",
            "Какие фильмы стали культовыми?",
            "Какие режиссеры изменили киноиндустрию?",
            "Какие жанры кино существуют?",
            "Какие направления в живописи были популярны в 20 веке?",
            "Какие картины вошли в список величайших произведений искусства?",
            "Какие виды театра существуют?",
            "Какие известные фильмы основаны на реальных событиях?",
            "Какие актеры являются культовыми в кино?",
            "Какие фильмы номинировались на Оскар за лучший фильм?",
            "Какие известные скульпторы создали знаменитые произведения искусства?",
            "Какие художники известны своими абстрактными работами?",
            "Какие фильмы были сняты по книгам известных авторов?"
        ],
        
        "Природа": [
            "Какие типы экосистем существуют?",
            "Какие животные находятся под угрозой исчезновения?",
            "Какие природные явления могут вызвать землетрясения?",
            "Какие растения могут расти в пустыне?",
            "Какие растения являются эндемиками определенных регионов?",
            "Какие существуют виды природных катастроф?",
            "Какие виды млекопитающих находятся под угрозой исчезновения?",
            "Какие природные ресурсы являются возобновляемыми?",
            "Какие факторы влияют на изменение климата?",
            "Какие растения используются в медицине?",
            "Какие виды птиц мигрируют на большие расстояния?",
            "Какие растения используются для лечения в традиционной медицине?",
            "Какие животные живут в Арктике?",
            "Какие природные зоны характеризуются высокой биоразнообразием?",
            "Какие виды насекомых играют важную роль в экосистеме?"
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
//            if SettingsModel.shared.getVibrationState() {}
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
