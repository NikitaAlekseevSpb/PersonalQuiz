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
    @IBOutlet var rangedSlider: UISlider!{
        didSet{
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.maximumValue = answerCount
            rangedSlider.value = answerCount / 2
        }
    }
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    private let questions = Question.getQuestion()
    private var answerChoosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[qestionIndex].answers
    }
    private var qestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultsVC = segue.destination as? ResultsViewController else {return}
        resultsVC.answerChoosen = answerChoosen
    }
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else {return}
        let currentAnswer = currentAnswers[buttonIndex]
        answerChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwitch, currentAnswer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answerChoosen.append(currentAnswer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed(_ sender: Any) {
        let index = lrintf(rangedSlider.value)
        answerChoosen.append(currentAnswers[index])
        nextQuestion()
    }
    
}

extension QuestionsViewController{
    private func setupUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
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
        case .multiple: showMultipleStackView(with: currentAnswers)
        case .ranged:showRangedStackView(with: currentAnswers)
        }
    }
    
    func showSingleStackView(with answer: [Answer]){
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answer ) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    func showMultipleStackView(with answers: [Answer]){
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    func showRangedStackView(with answers:[Answer]) {
        rangedStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
        
        
    }
    
    private func nextQuestion() {
        qestionIndex += 1
        
        if qestionIndex < questions.count {
            setupUI()
            return
        }
    performSegue(withIdentifier: "showResult", sender: nil)
    }
    

}
