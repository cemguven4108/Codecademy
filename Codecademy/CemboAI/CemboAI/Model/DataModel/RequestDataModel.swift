//
//  RequestDataModel.swift
//  CemboAI
//
//  Created by cem güven on 31.01.2024.
//

import Foundation

struct RequestData: Encodable {
    let model: String
    let message: [UserMessage]
}

struct UserMessage: Encodable {
    let role: String = "user"
    var content: String
}
