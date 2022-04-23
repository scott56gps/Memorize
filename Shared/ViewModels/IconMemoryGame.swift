//
//  IconMemoryGame.swift
//  Memorize (iOS)
//
//  Created by Scott Nicholes on 4/22/22.
//

import SwiftUI

class IconMemoryGame {
    let iconNames = ["square.and.arrow.up",
                   "square.and.arrow.up.fill",
                   "square.and.arrow.up.circle",
                   "square.and.arrow.up.circle.fill",
                   "square.and.arrow.up.trianglebadge.exclamationmark",
                   "square.and.arrow.down",
                   "square.and.arrow.down.fill",
                   "square.and.arrow.up.on.square",
                   "square.and.arrow.up.on.square.fill",
                   "square.and.arrow.down.on.square",
                   "square.and.arrow.down.on.square.fill",
                   "rectangle.portrait.and.arrow.right",
                   "rectangle.portrait.and.arrow.right.fill",
                   "pencil",
                   "pencil.circle",
                   "pencil.circle.fill",
                   "pencil.slash",
                   "square.and.pencil"]
    private var model: CardGame<String>
    var cards: [CardGame<String>.Card] { return model.cards }
    
    init(numberOfPairs: Int, iconNames: [String]) {
        self.model = CardGame<String>(numberOfPairs: numberOfPairs) { index -> String in
            iconNames[index]
        }
    }
    
}
