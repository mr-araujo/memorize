//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Murillo R. Araujo on 30/06/20.
//  Copyright © 2020 MR de Araujo. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    var body: some View {
        HStack {
            Grid(game.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        self.game.choose(card: card)
                }
                .padding(5)
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            if self.card.isFaceUp || !self.card.isMathed {
                ZStack {
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(90-90), clockwise: true)
                        .padding(5)
                        .opacity(0.4)
                    
                    Text(self.card.content)
                        .font(Font.system(size: fontSize(for: geometry.size)))
                }
                .cardify(isFaceUp: self.card.isFaceUp)
            }
        }
    }
}

private func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * 0.7
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(game: game)
    }
}
