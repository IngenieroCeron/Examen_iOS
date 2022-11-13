//
//  QuestionsModel.swift
//  Examen_iOS
//
//  Created by Eduardo Ceron on 12/11/22.
//

import Foundation

struct Results: Decodable {
    let data: [Question]
}

struct Question: Decodable, Hashable {
    let pregunta: String
    let values: [Values]
}
struct Values: Decodable, Hashable {
    let label: String
    let value: Int
}
