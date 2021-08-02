//
//  ContentView.swift
//  Memorize Enhanced
//
//  Created by Jesus Mendoza on 7/27/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemorizeViewModel
    
    var body: some View {
        VStack {
            startThemeButton()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.cards) { card in
                        Card(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card: card)
                            }
                    }
                }
            }
        }
        .padding([.leading, .bottom, .trailing])
    }
}

struct startThemeButton: View {
    var body: some View {
        Button(action: {}, label: { Text("New Game") })
    }
}

struct Card: View {
    let card: MemorizeModel<String>.Card
    var rectangle = RoundedRectangle(cornerRadius: 10)
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                rectangle
                    .foregroundColor(.white)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                rectangle.opacity(0)
            } else {
                rectangle
                    .foregroundColor(.orange)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MemorizeViewModel()
        
        Group {
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
            ContentView(viewModel: game)
                .preferredColorScheme(.light)
        }
    }
}
