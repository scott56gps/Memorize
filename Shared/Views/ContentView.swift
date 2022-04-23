//
//  ContentView.swift
//  Shared
//
//  Created by Scott Nicholes on 4/18/22.
//

import SwiftUI

struct ContentView: View {
    var imageNames = ["bolt", "0.circle", "01.square.fill", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle", "0.circle"]
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(imageNames, id: \.self) { imageName in
                        CardView(imageName: imageName)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    @State var isFaceUp = false
    var imageName = "bolt"
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3)
                Image(systemName: imageName)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
