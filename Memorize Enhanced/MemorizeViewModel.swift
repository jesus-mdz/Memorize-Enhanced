//
//  MemorizeGameViewModel.swift
//  Memorize Enhanced
//
//  Created by Jesus Mendoza on 7/30/21.
//

import SwiftUI

class MemorizeViewModel: ObservableObject {
    static let currentTheme: [String] = selectRandomTheme()
    
    static func createMemoryGame() -> MemorizeModel<String> {
        MemorizeModel<String>(numberOfPairsOfCards: 8, createCardContent: { index in currentTheme[index] })
    }
    
    var cards: [MemorizeModel<String>.Card] {
        return model.cards
    }
    
    @Published private var model = createMemoryGame()
    
    func choose(card: MemorizeModel<String>.Card) {
        model.choose(card)
    }
}

func selectRandomTheme() -> [String] {
    let themes = [
        ["🥨", "🥑", "🍌", "🍊", "🍇", "🥐", "🥒", "🥩", "🥝", "🌮", "🍟"],
        ["⚽️", "🏀", "🎾", "🏓", "⛳️", "🛹", "🏉", "🏐"],
        ["😄", "😂", "🙂", "😭", "🥶", "🥺", "😬"]
    ]
    let randomIndex = Int.random(in: 0..<themes.count-1)
    return themes[randomIndex]
}
