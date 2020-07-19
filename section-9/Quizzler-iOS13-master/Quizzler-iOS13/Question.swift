//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Suzy Lee on 7/19/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var title: String = ""
    var answer: String
    
    init (q: String, a: String) {
        self.title = q
        self.answer = a
    }
}
