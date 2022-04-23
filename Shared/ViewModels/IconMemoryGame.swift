//
//  IconMemoryGame.swift
//  Memorize (iOS)
//
//  Created by Scott Nicholes on 4/22/22.
//

import SwiftUI

// Much like the mind, a ViewModel presents the state of what you have and an interface
// to alter what you have.
//
// A View is like a person.  The View presents game state and an opportunity for the User
// to change game state.
//
// In life, when communicating with someone else, they will share with me their state.
// Based on my understanding of their state, I can take actions, such as,
//
// askQuestion()
// offerHelp()
class IconMemoryGame: ObservableObject {
    static let iconNames = ["square.and.arrow.up",
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
    
    static func createMemoryGame() -> CardGame<String> {
        CardGame<String>(numberOfPairs: 9) { index -> String in
            IconMemoryGame.iconNames[index]
        }
    }
    
    @Published private var model: CardGame<String> = IconMemoryGame.createMemoryGame()
    
    // MARK: - Access to Model
    // These should be the only windows into the state of the model, in this case, a Game
    // These should be read-only values, the only way the View can know what the game state is
    var cards: [CardGame<String>.Card] { return model.cards }
    var numberOfPairs: Int { model.numberOfPairs }
    
    // MARK: - Actions (User Intentions)
    // These should be the only handles a View has to take actions based on game state.
    // AKA, Potentially change game state
    func choose(card: CardGame<String>.Card) {
        model.chooseCard(card: card)
    }
}
