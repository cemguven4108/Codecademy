//
//  ContentView.swift
//  CemboAI
//
//  Created by cem güven on 30.01.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: OpenAIViewModel
    
    var body: some View {
        VStack{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            VStack {
                TextField("Ask Anything to OpenAI", text: $viewModel.message)
                    .fontDesign(.monospaced)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 0.5)
                    }
                    .onSubmit {
                        Task {
                            await viewModel.sendMessageToOpenAi()
                        }
                    }
                
                HStack {
                    Group{
                        Text("AI: ")
                        Text(viewModel.response)
                    }
                    .fontDesign(.monospaced)
                    .font(.title3)
                    .padding()
                }
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(OpenAIViewModel())
}
