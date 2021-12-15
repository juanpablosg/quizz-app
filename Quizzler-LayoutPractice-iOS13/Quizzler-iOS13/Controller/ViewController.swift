//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var progressBar: UIProgressView!
    @IBOutlet private weak var answer1Button: UIButton!
    @IBOutlet private weak var answer2Button: UIButton!
    @IBOutlet private weak var answer3Button: UIButton!
    
    private var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction private func answerButtonPressed(_ sender: UIButton) {
        
       
        
        guard  let userAnswer = sender.currentTitle else {
            return
        }
        
        let gotItRight = quizBrain.checkAnswer(userAnswer)
        
        sender.backgroundColor = gotItRight ? .green : .red
        
        quizBrain.nextQuestion()
        
       Timer.scheduledTimer(timeInterval: 0.2,
                            target: self,
                            selector: #selector(updateUI),
                            userInfo: nil,
                            repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.currentQuestion.text
        progressBar.progress = quizBrain.progress
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        let currentQuestion = quizBrain.currentQuestion.answer
        answer1Button.setTitle(currentQuestion[0], for: .normal)
        answer2Button.setTitle(currentQuestion[1], for: .normal)
        answer3Button.setTitle(currentQuestion[2], for: .normal)
        self.answer1Button.backgroundColor = .clear
        self.answer2Button.backgroundColor = .clear
        self.answer3Button.backgroundColor = .clear
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            self.trueButton.backgroundColor = UIColor.clear
//            self.falseButton.backgroundColor = UIColor.clear
//        }
        
        
    }
    
}


