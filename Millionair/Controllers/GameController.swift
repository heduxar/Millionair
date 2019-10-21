//
//  GameController.swift
//  Millionair
//
//  Created by Юрий Султанов on 20.10.2019.
//  Copyright © 2019 Юрий Султанов. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    
    @IBOutlet var question: UILabel!
    @IBOutlet var answerOne: UIButton!
    @IBOutlet var answerTwo: UIButton!
    @IBOutlet var answerThree: UIButton!
    @IBOutlet var answerFour: UIButton!
    
    @IBAction func checkAnswer(sender: UIButton) {
        guard let currentQuestion = arrayOfQuestions.first(where: { qst -> Bool in
            return qst.question == question.text
        }) else {return}
        if sender.currentTitle == currentQuestion.correctAnswer{
            arrayOfQuestions.removeAll { qst -> Bool in
                return qst.question == question.text
            }
            self.correctAnswers += 1
            self.changeQuestion()
        } else {
            guard self.correctAnswers > 0 else {
                self.dismiss(animated: true, completion: nil)
                return
            }
            self.saveAndExit()
        }
    }
    
    let buttonCornerRadius: CGFloat = 50
    var correctAnswers: Int = 0
    var correctAnswersHandler: ((Int) -> Void)?
    
    var arrayOfQuestions = [
        Question(question: "На каком инструменте, как считается, играл древнерусский певец и сказитель Боян?", correctAnswer: "На гуслях", answers: ["На виолончели", "На баяне", "На гитаре", "На гуслях"]),
        Question(question: "В какой из этих стран один из официальных языков - французский?", correctAnswer: "Республика Гаити", answers: ["Кения", "Эквадор", "Венесуэла", "Республика Гаити"]),
        Question(question: "В каком из этих фильмов не снимался Александр Абдулов?", correctAnswer: "\"Московские каникулы\"", answers: ["\"Карнавал\"", "\"Чародеи\"", "\"Убить дракона\"","\"Московские каникулы\""]),
        Question(question: "В каком году произошла Куликовская битва?", correctAnswer: "1380", answers: ["1380", "1569", "1616", "1773"] ),
        Question(question: "Кто автор музыки к детской песенке Чунга-Чанга?", correctAnswer: "Шаинский", answers: ["Шаинский", "Зацепин", "Дербенёв", "Шпиц"]),
        Question(question: "Какая картина Малевича находится в Русском музее?", correctAnswer: "Красный квадрат", answers: ["Красный квадрат", "Белый квадрат", "Чёрный квадрат", "\"Точильщик\""]),
        Question(question: "Шкала Сковилла - это шкала оценки...", correctAnswer: "Остроты перца", answers: ["Остроты перца", "Привлекательности женщин", "Качества атмосферного воздуха", "Уровня моря"]),
        Question(question: "Какой титул имел Дон Кихот?", correctAnswer: "Идальго", answers: ["Идальго", "Барон", "Маркиз", "Вождь"]),
        Question(question: "Кто автор антиутопического романа \"О дивный новый мир\"?", correctAnswer: "Олдос Хаксли", answers: ["Олдос Хаксли", "Джордж Оруэлл", "Рэй Брэдбери", "Сомерсет Моэм"]),
        Question(question: "Как называется самая глубокая точка поверхности Земли, находящаяся на дне Марианской впадины?", correctAnswer: "Бездна Челленджера", answers: ["Бездна Челленджера", "Филиппинская плита", "Кермадек", "Черное Логово"])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerOne.layer.cornerRadius = buttonCornerRadius
        answerTwo.layer.cornerRadius = buttonCornerRadius
        answerThree.layer.cornerRadius = buttonCornerRadius
        answerFour.layer.cornerRadius = buttonCornerRadius
        changeQuestion()
    }
    
    private func changeQuestion() {
        guard let qst = arrayOfQuestions.randomElement() else {self.saveAndExit(); return}
        self.question.text = qst.question
        let answers = qst.answers.shuffled()
        answerOne.setTitle(answers[0], for: .normal)
        answerTwo.setTitle(answers[1], for: .normal)
        answerThree.setTitle(answers[2], for: .normal)
        answerFour.setTitle(answers[3], for: .normal)
    }
    
    private func saveAndExit() {
        var percent: Int = 0
        guard self.correctAnswers > 0 else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        percent = arrayOfQuestions.count*100/correctAnswers
        let record = GameSession (date: Date(), score: correctAnswers, percent: percent)
        Game.shared.addRecord(record)
        self.correctAnswersHandler?(self.correctAnswers)
        self.dismiss(animated: true, completion: nil)
    }
}
