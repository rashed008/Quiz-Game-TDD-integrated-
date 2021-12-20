//
//  FlowTest.swift
//  QuizEngineTests
//
//  Created by Rashed on 20/12/21.
//

import XCTest
@testable import QuizEngine

class FlowTest: XCTestCase {
    func test_start_withNoQuestions_doesNotRouteToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: [], router: router)
        sut.start()
        XCTAssertTrue(router.routedQuestions.isEmpty)
    }
//    
//    func test_start_withOneQuestions_routesToQuestions() {
//        let router = RouterSpy()
//        let sut = Flow(questions: ["Q1","Q2"], router: router)
//        sut.start()
//        XCTAssertEqual(router.routedQuestionCount, ["Q1"])
//    }
    
    func test_start_withQuestions_routesToCorrectQuestions() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1","Q2"], router: router)
        sut.start()
        XCTAssertEqual(router.routedQuestion, "Q1")
    }
    
//    func test_startTwice_withQuestions_routesToCorrectQuestionsTwice() {
//        let router = RouterSpy()
//        let sut = Flow(questions: ["Q1","Q2"], router: router)
//        sut.start()
//        XCTAssertEqual(router.routedQuestion, "Q1")
//    }
    
    class RouterSpy: Router {
        var routedQuestionCount: Int = 0
        var routedQuestion: String? = nil
        var routedQuestions: [String] = []
        func routeTo(question: String) {
            routedQuestionCount += 1
            routedQuestion = question
            routedQuestions.append(question)
        }
    }

}
