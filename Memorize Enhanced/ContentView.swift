//
//  ContentView.swift
//  Memorize Enhanced
//
//  Created by Jesus Mendoza on 7/27/21.
//

import SwiftUI

var foodEmojis = ["🥨", "🥑", "🍌", "🍊", "🍇", "🥐", "🥒", "🥩", "🥝", "🌮", "🍟"]
var sportsEmojis = ["⚽️", "🏀", "🎾", "🏓", "⛳️", "🛹", "🏉", "🏐"]
var smileyEmojis = ["😄", "😂", "🙂", "😭", "🥶", "🥺", "😬"]

struct ContentView: View {
    @State var theme = foodEmojis
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle).fontWeight(.heavy).foregroundColor(.purple).padding()
            CardGrid(theme: theme)
            HStack {
                Spacer()
                foodButton
                Spacer()
                sportsButton
                Spacer()
                smileyButton
                Spacer()
            }
        }
        .padding([.leading, .bottom, .trailing])
    }
    
    var foodButton: some View {
        Button(
            action: {
                theme = foodEmojis
            },
            label: {
                VStack {
                    Text("􀸹")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    Text("Food")
                        .font(.caption)
                        .fontWeight(.heavy)
                }
            })
            .foregroundColor(.orange)
    }
    var sportsButton: some View {
        Button(
            action: {
                theme = sportsEmojis
            },
            label: {
                VStack {
                    Image(systemName: "sportscourt")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    Text("Sports")
                        .font(.caption)
                        .fontWeight(.heavy)
                }
            })
            .foregroundColor(.orange)
    }
    var smileyButton: some View {
        Button(
            action: {
                theme = smileyEmojis
            },
            label: {
                VStack {
                    Image(systemName: "face.smiling")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    Text("Smiley")
                        .font(.caption)
                        .fontWeight(.heavy)
                        
                }
            })
            .foregroundColor(.orange)
    }
}

struct CardGrid: View {
    var theme: [String]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(theme.shuffled(), id: \.self) { emoji in
                    Card(content: emoji, isFaceUp: false).aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
    }
}

struct Card: View {
    var content: String
    @State var isFaceUp: Bool
    var rectangle = RoundedRectangle(cornerRadius: 10)
    
    var body: some View {
        ZStack {
            if !isFaceUp {
                rectangle
                    .foregroundColor(.orange)
            } else {
                rectangle
                    .foregroundColor(.white)
                Text(content)
                    .font(.largeTitle)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
