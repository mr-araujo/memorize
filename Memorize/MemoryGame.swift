//
//  MemoryGame.swift
//  Memorize
//
//  Created by Murillo R. Araujo on 01/07/20.
//  Copyright © 2020 MR de Araujo. All rights reserved.
//

import Foundation


struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(pairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for index in 0..<pairsOfCards {
            let content = cardContentFactory(index)
            cards.append(Card(id:index * 2 + 1, content: content))
            cards.append(Card(id:index * 2 + 2, content: content))
        }
    }
    
    mutating func choose(card: Card) {
        print(card)
        let chosenIndex = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: Fix
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMathed: Bool = false
        var content: CardContent
    }
}
