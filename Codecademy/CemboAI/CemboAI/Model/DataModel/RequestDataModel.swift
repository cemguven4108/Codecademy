//
//  RequestDataModel.swift
//  CemboAI
//
//  Created by cem güven on 31.01.2024.
//

import Foundation

struct RequestData {
    let model: String
    let message: [UserMessage]
}

struct UserMessage {
    let role: String = "user"
    var content: String
}
