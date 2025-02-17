//
//  QuestionManager.swift
//  Boom
//
//  Created by Игорь Клевжиц on 13.02.2025.
//
import UIKit
import AVFAudio

final class QuestionManager {
    static let shared = QuestionManager()
    private var choiceCategotySound: AVAudioPlayer?
    
    private init() {
        loadSelectedCategories()
    }
    
    private var currentQuestions: [String] = []
    private var selectedCategories: [String] = ["О разном"] {
        didSet {
            updateCurrentQuestions()
            saveSelectedCategories()
        }
    }
    private var allQuestions: [String: [String]] = [
        "О разном": [
            "Назовите марки машин",
            "Назовите страны, где говорят на русском языке.",
            "Какие профессии существуют в сфере IT?",
            "Назовите африканские страны",
            "Назовите позвоночных животных",
            "Какие виды домашних животных вам известны?",
            "Назовите музыкальные жанры",
            "Какие страны находятся на территории Южной Америки?",
            "Какие элементы являются благородными газами?",
            "Назовите струнные музыкальные инструменты",
            "Назовите клавишные музыкальные инструменты",
            "Назовите бренды духов",
            "Назовите породы собак",
            "Назовите сорта винограда",
            "Какие страны являются членами Европейского Союза?"
        ],
        
        "Спорт и Хобби": [
            "Назовите зимние виды спорта.",
            "Назовите виды спорта, в которых участвуют больше 3-х игроков.",
            "Назовите виды спорта в которых участвуют животные",
            "Какие виды спорта практикуются в океане?",
            "Назовите виды единоборств.",
            "Какие спортивные дисциплины входят в олимпийские игры?",
            "Какие спортивные тренировки можно делать дома?",
            "Назовите командные виды спорта.",
            "Назовите экстремальные виды спорта",
            "Назовите виды спорты для которых неважна физическая подготовка",
            "Назовите виды спорта в которых используется мяч",
            "Назовите виды спорта в которых учавствуют транспортные средства",
            "Назовите виды тацев",
            "Назовите летние виды спорта",
            "Какие виды спорта требуют минимального оборудования?"
        ],
        
        "Про жизнь": [
            "Назовите мужские имена на буквк А",
            "Назовите женские имена на букву К",
            "Какие профессии связаны с медициной?",
            "Какие виды отношений существуют между людьми?",
            "Какие профессии требуют работы с людьми?",
            "Назовите популярные социальные сети.",
            "Какие бытовые приборы используются на кухне?",
            "Назовите виды общественного транспорта.",
            "Какие языки программирования вам известны?",
            "Назовите традиционные блюда разных стран.",
            "Назовите популярных производителей телефонов",
            "Назовите английские слова на букву М",
            "Назовите виды паст",
            "Назовите болезни человека",
            "Какие виды досуга популярны среди людей?"
        ],
        
        "Знаменитости": [
            "Назовите знаменитых людей, которые изменили историю.",
            "Назовите известных футболистов.",
            "Какие знаменитости прославились благодаря спорту?",
            "Какие мировые лидеры стали известными благодаря своей работе?",
            "Какие певцы и музыканты прославились в 21 веке?",
            "Назовите популярных актеров Голливуда.",
            "Назовите рок-группы",
            "Какие знаменитости стали известными благодаря интернету?",
            "Какие художники признаны мастерами в мире искусства?",
            "Какие писатели стали знаменитыми благодаря своим произведениям?",
            "Какие актеры снимались в фильмах Marvel?",
            "Назовите известных блогеров",
            "Назовите актрис блондинок",
            "Назовите знаменитых ученых.",
            "Назовите известные музыкальные дуэты"
        ],
        
        "Искусство и Кино": [
            "Назовите мультфильмы студии Disney.",
            "Какие сериалы стали культовыми?",
            "Назовите известные картины и их авторов.",
            "Назовите жанры живописи.",
            "Какие музыкальные инструменты используются в оркестре?",
            "Какие жанры кино существуют?",
            "Назовите фильмы ужасов",
            "Какие картины вошли в список величайших произведений искусства?",
            "Какие актеры известны своими ролями в комедиях?",
            "Назовите известные фильмы-катастрофы",
            "Назовите фильмы о космосе.",
            "Назовите диснеевских принцесс",
            "Назовите изветные трилогии кинематогрофа",
            "Назовите работников съемочной площадки",
            "Какие фильмы были сняты по книгам известных авторов?"
        ],
        
        "Природа": [
            "Назовите млекопитающих.",
            "Какие животные обитают в океане?",
            "Какие деревья растут в России?",
            "Какие виды рыб вам известны?",
            "Назовите виды змей.",
            "Какие существуют виды природных катастроф?",
            "Назовите птиц, которые не умеют летать.",
            "Какие животные обитают в Африке?",
            "Назовите ядовитых животных",
            "Какие растения используются в медицине?",
            "Назовите овощи",
            "Назовите фрукты",
            "Какие животные живут в Арктике?",
            "Назовите реки России",
            "Назовите виды обезьян"
        ]
    ]
    
    private func chiceVibration() {
        let notification = UINotificationFeedbackGenerator()
        notification.notificationOccurred(.success)
    }
    
    private func isSilentMode() -> Bool {
        return AVAudioSession.sharedInstance().secondaryAudioShouldBeSilencedHint
    }
    
    private func createPlayer(soundName: String) -> AVAudioPlayer? {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return nil }
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            return player
        } catch {
            print("ошибка \(soundName)")
            return nil
        }
    }
    
    private func playChoice() {
        guard !isSilentMode() else { return }
        GameModel.boomPlayer = createPlayer(soundName: ChoiseSound.choiceCategory)
        GameModel.boomPlayer?.play()
    }
    
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
            playChoice()
            saveSelectedCategories()
        } else {
            selectedCategories.append(category)
            playChoice()
            saveSelectedCategories()
        }
        if SettingsModel.shared.getVibrationState() {
            chiceVibration()
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
    
    func getSelectedCategories() -> [String] {
        return selectedCategories
    }
    
}
