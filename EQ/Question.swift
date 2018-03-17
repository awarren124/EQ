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
    
    public static let sampleQuestion = Question(subject: "Physics",
                                                question: "What is g?",
                                                answers: [
                                                    "9.8",
                                                    "400",
                                                    "69.420"
                                                ],
                                                correctAnswerIndex: 0)
}
