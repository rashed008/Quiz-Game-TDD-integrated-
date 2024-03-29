//
//  Flow.swift
//  QuizEngine
//
//  Created by Rashed on 20/12/21.
//

import Foundation

protocol Router {
    func routeTo(question: String, answerCallback: @escaping (String) -> Void)
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
            router.routeTo(question: firstQuestion) { [weak self] _ in
                guard let strongSelf = self else { return }
                let firstQuestionIndex = strongSelf.questions.firstIndex(of: firstQuestion)
                let nextQuestion = strongSelf.questions[firstQuestionIndex ?? 0 + 1]
                strongSelf.router.routeTo(question: nextQuestion) { _ in}
            }
        }
    }
}

