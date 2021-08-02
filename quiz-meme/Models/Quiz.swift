//
//  Quiz.swift
//  quiz-meme
//
//  Created by Felipe Seolin Bento on 01/08/21.
//

import UIKit

enum QuizLevel {
    case easy, medium, hard, superHard
}

class Quiz: NSObject {
    var name: String
    var level: QuizLevel
    var complete: Int = 0
    
    init(name: String, level: QuizLevel, complete: Int = 0) {
        self.name = name
        self.level = level
        self.complete = complete
    }
}
