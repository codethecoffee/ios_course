////
////  QuizBrain.swift
////  Quizzler-iOS13
////
////  Created by Suzy Lee on 7/19/20.
////  Copyright © 2020 The App Brewery. All rights reserved.
////
//
//import Foundation
//
//struct QuizBrain {
//    let quizQuestions = [
//        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
//        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
//        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
//        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
//        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
//        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
//        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
//        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
//        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
//        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
//    ]
//    
//    var currQNum = 0
//    var score = 0
//    
//    /**
//     This method checks whether the user selected the correct answer. If so,
//     the score is updated accordingly.
//     
//     - parameter userAnswer: The answer selected by the user.
//     - returns: Bool indicating whether user was correct or not.
//     
//     */
//    mutating func checkAnswer(_ userAnswer: String) -> Bool {
//        if userAnswer == quizQuestions[currQNum].correctAnswer {
//            // User got it right
//            self.score += 1
//            return true
//        }
//        else {
//            // User got it wrong
//            return false
//        }
//    }
//    
//    mutating func nextQuestion() {
//        if currQNum + 1 < quizQuestions.count {
//            currQNum += 1
//        }
//        else {
//            currQNum = 0
//        }
//    }
//    
//    func getQuestionText() -> String {
//        return quizQuestions[currQNum].title
//    }
//    
//    func getProgress() -> Float {
//        return Float(currQNum + 1)/Float(quizQuestions.count)
//    }
//    
//    func getScore() -> String {
//        return String(self.score)
//    }
//    
//    /**
//     This method returns the array of possible answers for the current question.
//     
//     - returns: The list of answer options
//     
//     */
//    func getAnswers() -> [String] {
//        return quizQuestions[currQNum].answer
//    }
//
//}
