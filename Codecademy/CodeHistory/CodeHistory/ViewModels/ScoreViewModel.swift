//
//  ScoreViewModel.swift
//  CodeHistory
//
//  Created by cem güven on 7.02.2024.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
