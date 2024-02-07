//
//  GameView.swift
//  CodeHistory
//
//  Created by cem güven on 19.01.2024.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                Text(viewModel.questionProgressText)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding()
                QuestionView(question: viewModel.currentQuestion)
            }
            .foregroundColor(.white)
            .navigationBarHidden(true)
            .environmentObject(viewModel)
        }
        .background(
            NavigationLink(
                destination: ScoreView(
                    viewModel: ScoreViewModel(
                        correctGuesses: viewModel.correctGuesses,
                        incorrectGuesses: viewModel.incorrectGuesses
                    )
                ),
                label: { EmptyView() }
            )
        )
    }
}

#Preview {
    GameView()
}

