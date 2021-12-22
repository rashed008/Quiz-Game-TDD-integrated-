//
//  FlowTest.swift
//  QuizEngineTests
//
//  Created by Rashed on 20/12/21.
//

import XCTest
@testable import QuizEngine

class FlowTest: XCTestCase {
    let router = RouterSpy()
    func test_start_withNoQuestions_doesNotRouteToQuestion() {
        let sut = Flow(questions: [], router: router)
        sut.start()
        XCTAssertTrue(router.routedQuestions.isEmpty)
    }
    
    func test_start_withOneQuestions_routesToCorrectQuestions() {
        let sut = Flow(questions: ["Q1"], router: router)
        sut.start()
        XCTAssertEqual(router.routedQuestions, ["Q1"])
    }
//    
//    func test_start_withOneQuestions_routesToQuestions() {
//        let router = RouterSpy()
//        let sut = Flow(questions: ["Q1","Q2"], router: router)
//        sut.start()
//        XCTAssertEqual(router.routedQuestionCount, ["Q1"])
//    }
    
    func test_start_withQuestions_routesToCorrectQuestions() {
        let sut = Flow(questions: ["Q1","Q2"], router: router)
        sut.start()
        XCTAssertEqual(router.routedQuestions, ["Q1"])
    }
    
    func test_startTwice_withQuestions_routesToCorrectQuestionsTwice() {
        let sut = Flow(questions: ["Q1","Q2"], router: router)
        sut.start()
        sut.start()
        XCTAssertEqual(router.routedQuestions, ["Q1","Q1"])
    }
    
//    func test_startAndAnswerFristQuestion_withTwoQuestions_routesToSecondQuestions() {
//        let sut = Flow(questions: ["Q1","Q2"], router: router)
//        sut.start()
//        router.answerCallback("A1")
//        XCTAssertEqual(router.routedQuestions, ["Q1","Q2"])
//    }
    
    class RouterSpy: Router {
        var routedQuestions: [String] = []
        var answerCallback : ((String) -> Void) = { _ in}
        
        func routeTo(question: String, answerCallback: @escaping ((String)) -> Void) {
            routedQuestions.append(question)
            self.answerCallback = answerCallback
        }
    }

}
