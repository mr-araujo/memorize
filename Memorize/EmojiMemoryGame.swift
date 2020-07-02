//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Murillo R. Araujo on 01/07/20.
//  Copyright © 2020 MR de Araujo. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(pairsOfCards: emojis.count) { index in
            return emojis[index]
        }
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
