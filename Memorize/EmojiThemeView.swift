//
//  EmojiThemeView.swift
//  Memorize
//
//  Created by Murillo R. Araujo on 23/07/20.
//  Copyright © 2020 MR de Araujo. All rights reserved.
//

import SwiftUI

struct EmojiThemeView: View {
    var emojiThemes = themes
    
    var body: some View {
        NavigationView {
            List(emojiThemes) { theme in
                NavigationLink(destination: EmojiMemoryGameView(game: EmojiMemoryGame(theme: theme))) {
                    HStack {
                        Text(theme.emojis[0])
                        Text(theme.name)
                    }
                }
            }
            .navigationBarTitle(Text("Themes"))
        }
    }
}

struct EmojiThemeView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiThemeView()
    }
}
