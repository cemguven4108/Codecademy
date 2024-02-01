//
//  CemboAIApp.swift
//  CemboAI
//
//  Created by cem güven on 30.01.2024.
//

import SwiftUI

@main
struct CemboAIApp: App {
    @StateObject var viewModel = OpenAIViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
