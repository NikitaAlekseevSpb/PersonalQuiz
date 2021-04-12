//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by MacBook on 12.04.2021.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    private let questions = Question.getQuestion()
    private let answerChoosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[qestionIndex].answers
    }
    private var qestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
    }
    
    @IBAction func multipleAnswerButtonPressed() {
    }
    
    @IBAction func rangedAnswerButtonPressed(_ sender: Any) {
    }
    
}

extension QuestionsViewController{
    private func setupUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden.toggle()
        }
        
        let currentQestion = questions[qestionIndex]
        questionLabel.text = currentQestion.title
        
        let totalPrograsse = Float(qestionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalPrograsse, animated: true)
    
        title = "Вопрос № \(qestionIndex + 1) из \(questions.count)"
    
        showCurrentAnswers(for: currentQestion.type)
    }
    
    private func showCurrentAnswers(for type: ResponseType){
        switch type {
        case .single: showSingleStackView(with: currentAnswers)
        case .multiple: break
        case .ranged: break
        }
    }
    
    func showSingleStackView(with answer: [Answer]){
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answer ) {
            button.setTitle(answer.title, for: .normal)
        }
    }

}
