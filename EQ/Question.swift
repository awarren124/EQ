//
//  Question.swift
//  EQ
//
//  Created by Alexander Warren on 3/17/18.
//  Copyright © 2018 Alexander Warren. All rights reserved.
//

import Foundation

public struct Question {
    var subject: String = "Physics"
    var question: String = "What is g?"
    var answers: [String] = [
        "9.8",
        "400",
        "69.420"
    ]
    var correctAnswerIndex: Int = 0
    
//    public static let sampleQuestion = Question(subject: "Physics",
//                                                question: "What is g?",
//                                                answers: [
//                                                    "9.8",
//                                                    "400",
//                                                    "69.420"
//                                                ],
//                                                correctAnswerIndex: 0)
    init(json: [String: Any]) {
        print(json)
        question = json["question"] as! String
//        let a = json["answers"] as! [String: String]
        answers[0] = json["1"]! as! String
        answers[1] = json["2"]! as! String
        answers[2] = json["3"]! as! String
        correctAnswerIndex = (json["correct"] as! Int) - 1
    }
}
