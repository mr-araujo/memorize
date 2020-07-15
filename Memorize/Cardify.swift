//
//  Cardify.swift
//  Memorize
//
//  Created by Murillo R. Araujo on 15/07/20.
//  Copyright © 2020 MR de Araujo. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                content
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
