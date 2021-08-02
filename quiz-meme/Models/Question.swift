//
//  Question.swift
//  quiz-meme
//
//  Created by Felipe Seolin Bento on 31/07/21.
//

import UIKit

class Question: NSObject {
    let question: String
    let image: UIImage
    let options: [Option]
    var selectedOption: Option? = nil
    
    init(question: String, image: UIImage,options: [Option]) {
        self.question = question
        self.image = image
        self.options = options
    }
}
