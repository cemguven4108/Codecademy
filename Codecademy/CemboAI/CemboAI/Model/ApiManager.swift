//
//  ApiManager.swift
//  CemboAI
//
//  Created by cem güven on 31.01.2024.
//

import Foundation

final class ApiManager {
    private let apiKey = ""
    private let url = "https://api.openai.com/v1/chat/completions"
    private let urlSession = URLSession.shared
    
    static let shared = ApiManager()
    
    private init() {
        
    }
}

extension ApiManager {
    func apiRequest(message: String) async throws -> AiResponse {
        guard let url = URL(string: url) else { throw error.invalidURL }
        
        let urlRequest = try configUrlRequest(message: message, url: url)
        
        let (data, response) = try await urlSession.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw error.invalidResponse }
        
        return try JSONDecoder().decode(AiResponse.self, from: data)
    }
    
    private func configUrlRequest(message: String, url: URL) throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        let message = RequestData(model: "gpt-3.5-turbo", message: [UserMessage(content: message)])
        let urlBody = try JSONEncoder().encode(message)
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.httpBody = urlBody
        
        return urlRequest
    }
}

private extension ApiManager {
    enum error: Error {
        case invalidURL
        case invalidResponse
    }
}
