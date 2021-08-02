//
//  MemorizeGame.swift
//  Memorize Enhanced
//
//  Created by Jesus Mendoza on 7/30/21.
//

import Foundation

struct MemorizeModel<CardContent> {
    private(set) var cards: Array<Card>
    
    private var faceUpCardIndex: Int?
    
    mutating func choose(_ card: Card) where CardContent: Equatable {
        if let chosenIndex =
            cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = faceUpCardIndex {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                faceUpCardIndex = nil
            } else {
                for index in 0..<cards.count {
                    cards[index].isFaceUp = false
                }
                faceUpCardIndex = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        var pairNumber = 1;

        for index in 0..<numberOfPairsOfCards {
            let content = createCardContent(index)
            
            let firstCard = Card(content: content, pairNumber: pairNumber, id: index*2)
            let secondCard = Card(content: content, pairNumber: pairNumber, id: index*2+1)
            
            pairNumber += 1
            
            cards.append(firstCard)
            cards.append(secondCard)
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var pairNumber: Int
        var id: Int
    }
    
    struct Theme {
        var name: String
        var emoji: String
        var amountOfCards: Int
        var color: String
    }
}
