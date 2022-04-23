//
//  CardGame.swift
//  Memorize (iOS)
//
//  Created by Scott Nicholes on 4/22/22.
//

struct CardGame<CardContent> {
    var cards: [Card]
    var numberOfPairs: Int
    
    init(numberOfPairs: Int, cardContentCreator: (Int) -> CardContent) {
        self.numberOfPairs = numberOfPairs
        self.cards = Array(0..<numberOfPairs).reduce(into: []) { array, number in
            let content = cardContentCreator(number)
            array.append(contentsOf: [Card(id: number * 2, content: content), Card(id: (number * 2) + 1, content: content)])
        }
    }
    
    mutating func chooseCard(card: Card) {
        if let indexOfCard = cards.firstIndex(where: { iterCard in
            iterCard.id == card.id
        }) {
            cards[indexOfCard].isFaceUp.toggle()
        }
    }
    
    struct Card: Identifiable {
        var id: Int  // Identifiable
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
