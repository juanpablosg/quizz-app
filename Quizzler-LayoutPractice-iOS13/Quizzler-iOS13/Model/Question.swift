//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Juan Pablo Sanchez Gonzalez on 15/09/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question2 {
    let text: String
    let answer: [String]
    let correctAnswer: String
}

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
    
//    func connect(with question: String) {
//        connect(with: <#T##String#>)
//    }
}
