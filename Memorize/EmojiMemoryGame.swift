//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Murillo R. Araujo on 01/07/20.
//  Copyright © 2020 MR de Araujo. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    let theme: EmojiTheme
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    private static func createMemoryGame(theme: EmojiTheme) -> MemoryGame<String> {
        let emojis = theme.emojis
        return MemoryGame<String>(pairsOfCards: emojis.count) { index in
            return emojis[index]
        }
    }
    
    init(theme: EmojiTheme) {
        self.theme = theme
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
     
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
