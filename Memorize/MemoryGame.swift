//
//  MemoryGame.swift
//  Memorize
//
//  Created by Murillo R. Araujo on 01/07/20.
//  Copyright © 2020 MR de Araujo. All rights reserved.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { return cards.indices.filter { cards[$0].isFaceUp }.only }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(pairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for index in 0..<pairsOfCards {
            let content = cardContentFactory(index)
            cards.append(Card(id:index * 2 + 1, content: content))
            cards.append(Card(id:index * 2 + 2, content: content))
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMathed {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMathed = true
                    cards[potentialMatchIndex].isMathed = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMathed: Bool = false
        var content: CardContent
    }
}
