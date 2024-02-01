//
//  AiResponse.swift
//  CemboAI
//
//  Created by cem güven on 31.01.2024.
//

import Foundation

struct AiResponse: Decodable {
    let choices: [Response]
}

struct Response: Decodable {
    let message: Message
}

struct Message: Decodable {
    let role, content: String
}
