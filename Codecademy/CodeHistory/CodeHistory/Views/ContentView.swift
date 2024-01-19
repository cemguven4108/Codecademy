//
//  ContentView.swift
//  CodeHistory
//
//  Created by cem güven on 19.01.2024.
//

import SwiftUI

struct ContentView: View {
    let question = Question(
        questionText: "What was the first computer bug?",
        possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
        correctAnswerIndex: 2)
    
    @State var mainColor = Color(red: 20/555, green: 28/255, blue: 58/255)
    let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
    
    var body: some View {
        VStack {
            ZStack {
                mainColor.ignoresSafeArea()
                VStack {
                    Text("1 / 10")
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .padding()
                    Text(question.questionText)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.leading)
                    Spacer()
                    HStack {
                        ForEach(0 ..< question.possibleAnswers.count) { answerIndex in
                            Button(action: {
                                print("Tapped on option with text: \(question.possibleAnswers[answerIndex])")
                                mainColor = answerIndex == question.correctAnswerIndex ? .green : .red
                            }, label: {
                                ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                            })
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}

