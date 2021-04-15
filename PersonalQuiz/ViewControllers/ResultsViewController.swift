//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by MacBook on 12.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var labelResultAnimal: UILabel!
    @IBOutlet var labelDescriptionResult: UILabel!
    
    var answerChoosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        getResult()
        navigationItem.hidesBackButton = true
    }

}

extension ResultsViewController{
    private func getResult(){
        
        var animalsAndAnswer: [AnimalType: Int] = [:]
        let animalsType = answerChoosen.map({$0.type})
        
        for animal in animalsType {
            if let counAnimal = animalsAndAnswer[animal] {
                animalsAndAnswer.updateValue(counAnimal + 1, forKey: animal)
            } else {
               animalsAndAnswer[animal] = 1
            }
        
        
            let sortedAnswerAndAnimal = animalsAndAnswer.sorted(by: {$0.value > $1.value})
            guard let resultAnswer = sortedAnswerAndAnimal.first?.key else {return}
        
            labelResultAnimal.text = " Вы - \(resultAnswer.rawValue)"
            labelDescriptionResult.text = resultAnswer.definition
        }
    }
            
}

