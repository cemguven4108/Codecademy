//
//  AiResponse.swift
//  CemboAI
//
//  Created by cem güven on 31.01.2024.
//

import Foundation

struct AiResponse {
    let choices: [Response]
}

struct Response {
    let message: Message
}

struct Message {
    let role, content: String
}
