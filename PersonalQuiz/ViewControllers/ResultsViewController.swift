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
        
        
    }

}

extension ResultsViewController{
    private func getResult(){
        
        var res = answerChoosen.sorted(by: {(first: Answer, second: Answer ) -> Bool in
            first.type == second.type})
        
        let a = "\(res.last?.type.rawValue)"
        
        labelResultAnimal.text = "\(res.last!.type.rawValue)"
       
        
        var cat = 0
        var dog = 0
        var rabbite = 0
        var tyrtle = 0
        
        for type in answerChoosen {
        switch type.type {
            case .dog: dog += 1
            case .cat: cat += 1
            case .rabbite: rabbite += 1
            case .turtle: tyrtle += 1
            }
        }
        print(dog, cat, rabbite, tyrtle)
        }
        }
            
            
        
    

