//
//  Option.swift
//  quiz-meme
//
//  Created by Felipe Seolin Bento on 31/07/21.
//

import UIKit

class Option: NSObject {
    let title: String
    let action: (_ option: Option) -> Void
//    let action: Selector
    let isCorrect: Bool
    
    init(title: String, action: @escaping (_ option: Option) -> Void, isCorrect: Bool = false) {
        self.title = title
        self.action = action
        self.isCorrect = isCorrect
    }
}
