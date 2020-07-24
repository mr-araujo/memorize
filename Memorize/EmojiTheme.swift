//
//  EmojiTheme.swift
//  Memorize
//
//  Created by Murillo R. Araujo on 23/07/20.
//  Copyright © 2020 MR de Araujo. All rights reserved.
//

import SwiftUI
import Foundation

struct EmojiTheme: Identifiable {
    let id = UUID()
    let name: String
    var emojis: [String]
    let color: Color
    
      
    init(name: String, emojis: [String], color: Color) {
        self.name = name
        self.emojis = emojis
        self.color = color
    }
}

let themes = [halloween, gaming, animals, christmas, food, vehicles, faces]
let halloween = EmojiTheme(name: "Halloween", emojis: ["👻","🎃","🕷","👺","🍬","🍭","💀","🧠","👁", "🕸"], color: Color.orange)
let gaming = EmojiTheme(name: "Gaming", emojis: ["🎮","🕹","🎳","🎰","👾","🎲","🤖","🏈","🏓","🖥"], color: Color.blue)
let animals = EmojiTheme(name: "Animals", emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐼","🐨","🐯","🦁"], color: Color.yellow)
let christmas = EmojiTheme(name: "Christmas", emojis: ["🤶🏻","🎅🏻","🎄","⛄️","☃️","❄️","🎁", "🥂", "🍾", "🦌"], color: Color.red)
let food = EmojiTheme(name: "Food", emojis: ["🍉","🍓","🍒","🥦","🥕","🧀","🥞","🥩","🍔","🍕"], color: Color.purple)
let vehicles = EmojiTheme(name: "Vehicles", emojis: ["🚗","🚎","🏎","🚓","🚑","🚒","🚜","🚂","✈️","🚀"], color: Color.gray)
let faces = EmojiTheme(name: "Faces", emojis: ["😇","😉","😍","😘","😝","🤪","😎","😡","🥶","🤢",], color: Color.green)
