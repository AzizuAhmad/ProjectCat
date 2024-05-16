//
//  QuestionModel.swift
//  Multiple-Choise
//
//  Created by MacBook Air on 04/05/24.
//

import Foundation

struct QuestionModel : Identifiable {
    var id: Int
    var question : String
    var description : String?
    var options : [String]
    var selection : String?
}
