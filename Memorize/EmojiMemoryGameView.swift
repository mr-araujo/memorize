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
        VStack {
            Grid(game.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.6)) {
                        self.game.choose(card: card)
                    }
                }
                .padding(5)
                .foregroundColor(self.game.theme.color)
            }
            .padding()
            .navigationBarTitle(Text(self.game.theme.name))
            
            Button(action: {
                withAnimation(.easeInOut) {
                    self.game.resetGame()
                }
            }, label: {
                Text("New Game")
            })
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            if self.card.isFaceUp || !self.card.isMatched {
                ZStack {
                    Group {
                        if self.card.isConsumingBonusTime {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-self.animatedBonusRemaining * 360 - 90), clockwise: true)
                                .onAppear() {
                                    self.startBonusTimeAnimation()
                            }
                        } else {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-self.card.bonusRemaining * 360 - 90), clockwise: true)
                        }
                    }
                    .padding(5)
                    .opacity(0.4)
                    
                    Text(self.card.content)
                        .font(Font.system(size: fontSize(for: geometry.size)))
                        .rotationEffect(Angle.degrees(self.card.isMatched ? 360 : 0))
                        .animation(Animation.linear(duration: 1))
                }
                .cardify(isFaceUp: self.card.isFaceUp)
                .transition(.scale)
            }
        }
    }
}

private func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * 0.7
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(theme: themes[0])
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(game: game)
    }
}
