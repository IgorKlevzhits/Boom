//
//  QuestionModel.swift
//  Boom
//
//  Created by Игорь Клевжиц on 11.02.2025.
//

import Foundation

enum QuestionCategory: String, CaseIterable {
    case random = "О разном"
    case sportsAndHobbies = "Спорт и Хобби"
    case life = "Про жизнь"
    case celebrities = "Знаменитости"
    case artAndCinema = "Искусство и Кино"
    case nature = "Природа"
}

struct Question {
    let text: String
}

class QuestionBank {
    private var allQuestions: [QuestionCategory: [Question]] = [
        .random: [
            Question(text: "Какие страны вы посетили?"),
            Question(text: "Какие книги вы посоветуете для саморазвития?"),
            Question(text: "Какую музыку вы предпочитаете слушать?"),
            Question(text: "Каковы ваши увлечения?"),
            Question(text: "Что помогает вам расслабиться?"),
            Question(text: "Какие достижения в своей жизни вы считаете важными?"),
            Question(text: "Что для вас означает успех?"),
            Question(text: "Какую кухню мира вы предпочитаете?"),
            Question(text: "Как вы боретесь с ленью?"),
            Question(text: "Какие языки вы бы хотели изучить?"),
            Question(text: "Что значит быть хорошим другом?"),
            Question(text: "Какие места для путешествий вы мечтаете посетить?"),
            Question(text: "Какие фильмы вам нравятся?"),
            Question(text: "Что вы любите делать в свободное время?"),
            Question(text: "Какие вещи важны в отношениях?")
        ],
        .sportsAndHobbies: [
            Question(text: "Назовите зимние виды спорта"),
            Question(text: "Какие бывают командные виды спорта?"),
            Question(text: "Какие виды спорта популярны в вашей стране?"),
            Question(text: "Какие виды спорта являются олимпийскими?"),
            Question(text: "Что такое экстримальные виды спорта?"),
            Question(text: "Какие виды спорта существуют для людей с ограниченными возможностями?"),
            Question(text: "Назовите самые популярные виды водных видов спорта"),
            Question(text: "Какие игры бывают в баскетболе?"),
            Question(text: "Назовите основные виды легкой атлетики"),
            Question(text: "Какие виды спорта на снегу и льду существуют?"),
            Question(text: "Что такое автоспорт?"),
            Question(text: "Назовите виды спорта, связанные с борьбой"),
            Question(text: "Какие виды спорта имеют самые сложные правила?"),
            Question(text: "Какие виды спорта наиболее травматичны?"),
            Question(text: "Что такое фитнес и какие виды упражнений в него входят?")
        ],
        .life: [
            Question(text: "Что делает человека счастливым?"),
            Question(text: "Какие навыки полезны в повседневной жизни?"),
            Question(text: "Как справляться со стрессом?"),
            Question(text: "Что важнее: успех или счастье?"),
            Question(text: "Какой образ жизни считается здоровым?"),
            Question(text: "Какие привычки способствуют долголетию?"),
            Question(text: "Что такое эмоциональный интеллект?"),
            Question(text: "Что делать, чтобы не жалеть о сделанных ошибках?"),
            Question(text: "Как найти баланс между работой и личной жизнью?"),
            Question(text: "Какие факторы влияют на качество жизни?"),
            Question(text: "Что значит быть уверенным в себе?"),
            Question(text: "Какие советы по улучшению сна вы можете дать?"),
            Question(text: "Как развивать внимательность и осознанность?"),
            Question(text: "Какие шаги помогают улучшить финансовую грамотность?"),
            Question(text: "Как принимать решения в сложных ситуациях?")
        ],
        .celebrities: [
            Question(text: "Назовите известных актеров современности"),
            Question(text: "Какие музыканты получили Грэмми в последние годы?"),
            Question(text: "Какие спортсмены прославились в 2020-х годах?"),
            Question(text: "Назовите самых популярных блогеров"),
            Question(text: "Какие режиссеры выиграли Оскар в последние годы?"),
            Question(text: "Назовите самых известных писателей в мире"),
            Question(text: "Какие артисты сейчас на пике популярности?"),
            Question(text: "Кто является лидером мирового киноиндустрии?"),
            Question(text: "Какие модели были признаны самыми успешными?"),
            Question(text: "Назовите великих ученых прошлого"),
            Question(text: "Какие музыканты оказали наибольшее влияние на музыку 20 века?"),
            Question(text: "Какие актеры прославились в театре?"),
            Question(text: "Какие знаменитости поддерживают экологические инициативы?"),
            Question(text: "Назовите известных художников современной эпохи"),
            Question(text: "Какие спортсмены стали бизнесменами?")
        ],
        .artAndCinema: [
            Question(text: "Какие фильмы получили Оскар?"),
            Question(text: "Какие жанры живописи вы знаете?"),
            Question(text: "Назовите самые известные художественные направления"),
            Question(text: "Какую роль в кино играют спецэффекты?"),
            Question(text: "Какие фильмы были культовыми в 80-х годах?"),
            Question(text: "Какие режиссеры сняли фильмы, ставшие классикой кино?"),
            Question(text: "Какие художественные произведения были экранизированы в последние годы?"),
            Question(text: "Какие картины признаны шедеврами искусства?"),
            Question(text: "Какие художники изобразили природу на своих картинах?"),
            Question(text: "Какие фильмы 90-х годов стали знаковыми?"),
            Question(text: "Какие театральные постановки изменили современное искусство?"),
            Question(text: "Какие кинематографические приемы часто используются в фильмах ужасов?"),
            Question(text: "Какую роль в искусстве играет современная фотография?"),
            Question(text: "Какие театры считают важнейшими в мире?"),
            Question(text: "Какие фильмы основаны на реальных событиях?")
        ],
        .nature: [
            Question(text: "Какие животные живут в Арктике?"),
            Question(text: "Как называются самые высокие горы?"),
            Question(text: "Назовите самые редкие виды животных в мире"),
            Question(text: "Какие растения растут в тропических лесах?"),
            Question(text: "Какие экосистемы существуют в мире?"),
            Question(text: "Какие виды рыб водятся в реках и озерах?"),
            Question(text: "Что такое биоразнообразие и почему оно важно?"),
            Question(text: "Какие вулканы являются самыми активными?"),
            Question(text: "Какие млекопитающие являются самыми быстрыми?"),
            Question(text: "Какого рода растения называются кактусами?"),
            Question(text: "Какие растения характерны для пустынь?"),
            Question(text: "Какие животные обитают в джунглях?"),
            Question(text: "Какие заповедники и национальные парки существуют в мире?"),
            Question(text: "Каковы особенности климата в разных частях мира?"),
            Question(text: "Какие реки считаются самыми длинными?")
        ]
    ]
    
    private var remainingQuestions: [QuestionCategory: [Question]] = [:]

    init() {
        resetQuestions()
    }
    
    private func resetQuestions() {
        remainingQuestions = allQuestions.mapValues { $0.shuffled() }
    }

    func getNextQuestion(from categories: [QuestionCategory]) -> Question? {
        let availableCategories = categories.filter { remainingQuestions[$0]?.isEmpty == false }

        guard let category = availableCategories.randomElement(),
              var categoryQuestions = remainingQuestions[category], !categoryQuestions.isEmpty else {
            return nil
        }

        let question = categoryQuestions.removeFirst()
        remainingQuestions[category] = categoryQuestions

        if categoryQuestions.isEmpty {
            remainingQuestions[category] = allQuestions[category]?.shuffled()
        }

        return question
    }
}
