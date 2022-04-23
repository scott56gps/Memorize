//
//  ContentView.swift
//  Shared
//
//  Created by Scott Nicholes on 4/18/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: IconMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card: card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    var card: CardGame<String>.Card
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3)
                Image(systemName: card.content)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: IconMemoryGame())
        ContentView(game: IconMemoryGame())
            .preferredColorScheme(.dark)
    }
}
