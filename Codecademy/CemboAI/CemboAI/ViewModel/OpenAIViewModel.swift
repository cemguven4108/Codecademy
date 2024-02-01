//
//  OpenAIViewModel.swift
//  CemboAI
//
//  Created by cem güven on 31.01.2024.
//

import Foundation

class OpenAIViewModel: ObservableObject {
    @Published var message: String = ""
    @Published var response: String = ""
    
    private let apiManager = ApiManager.shared
}

extension OpenAIViewModel {
    func sendMessageToOpenAi() async {
        do {
            let result = try await apiManager.apiRequest(message: message)
            response = result.choices[0].message.content
        } catch {
            print(error.localizedDescription)
        }
    }
}
