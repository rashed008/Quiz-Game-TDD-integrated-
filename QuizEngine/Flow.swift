//
//  Flow.swift
//  QuizEngine
//
//  Created by Rashed on 20/12/21.
//

import Foundation

protocol Router {
    func routeTo(question: String)
}

class Flow {
    let router : Router
    let questions : [String]
    init(questions:[String], router: Router) {
        self.questions = questions
        self.router = router
    }
    
    func start() {
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion)
        }
    }
}

