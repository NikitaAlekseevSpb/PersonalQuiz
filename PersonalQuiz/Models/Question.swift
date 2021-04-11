//
//  Question.swift
//  PersonalQuiz
//
//  Created by MacBook on 06.04.2021.
//

struct Question {
    let title: String
    let type: ResponseType
    let answers: [Answer]
    
    static func getQuestion() -> [Question] {
        [
            Question(
                title: "Какую пищу вы предпочитаете?",
                type: .single,
                answers: [
                    Answer(title: "Стейк", type: .dog),
                    Answer(title: "Рыба", type: .cat),
                    Answer(title: "Морковь", type: .rabbite),
                    Answer(title: "Кукуруза", type: .turtle)
                    
                ]
            ),
            Question(
                title: "Что вам нравится больше?",
                type: .multiple,
                answers:  [
                    Answer(title: "Плавать", type: .dog),
                    Answer(title: "Спать", type: .cat),
                    Answer(title: "Обниматься", type: .rabbite),
                    Answer(title: "Есть", type: .turtle)
                ]

            ), 
            Question(
                title: "Любите ли вы поездки на машине?",
                type: .ranged,
                answers:  [
                    Answer(title: "Ненавижу", type: .cat),
                    Answer(title: "Нервничаю", type: .rabbite),
                    Answer(title: "Незамечаю", type: .turtle),
                    Answer(title: "Обажаю", type: .dog)
                ]

            )
        ]
    }
    
    
}

struct Answer {
    let title: String
    let type: AnimalType
    
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

enum AnimalType: Character {
    case dog =  "🐶"
    case cat = "🐱"
    case rabbite = "🐇"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружете себя людьми которые вам нравятся и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме. Гуляете сами по себе. Цените одиночество"
        case .rabbite:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии"
        case .turtle:
            return "Ваша сила в мудрости. Медленный и вдумчивый выигрывет на больших дистанциях"
        }
    }
}
