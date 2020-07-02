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
    
    func choose(card: Card) {
        print("Card chosen: \(card)")
    }
    
    init(pairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for index in 0..<pairsOfCards {
            let content = cardContentFactory(index)
            cards.append(Card(id:index + 1, content: content))
            cards.append(Card(id:index + 2, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMathed: Bool = false
        var content: CardContent
    }
}
