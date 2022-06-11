//
//  ContentView.swift
//  Memorize
//
//  Created by 배주현 on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = [["🚗","🚌","🚀","⛴","🚔", "🚍", "🚠", "🚝","🚃","🚢", "⛵️","✈️","🚇","🛵"],["😀","🥹","😌","😎","🤩","😡","🥶","🤥","🫥","😇"],["🐶","🐹","🐻","🐷","🐴","🐳","🦧","🐊","🐙","🦑","🐈‍⬛","🦢"]]
    @State var whichEmoji = 0
    @State var emojiCount = 5
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[whichEmoji][0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji, isFaceUp: true).aspectRatio(2/3,contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                vehicle
                Spacer()
                face
                Spacer()
                animal
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
        
    }
    var vehicle: some View {
        Button {
            emojis[0].shuffle()
            whichEmoji = 0
            emojiCount = Int.random(in: 4..<emojis[0].count)
        } label: {
            VStack {
                Image(systemName: "car")
                Text("vehicle").font(.body)
            }
        }
    }
    var face: some View {
        Button {
            emojis[1].shuffle()
            whichEmoji = 1
            emojiCount = Int.random(in: 4..<emojis[1].count)
        } label: {
            VStack {
                Image(systemName: "face.smiling")
                Text("face").font(.body)
            }
        }
    }
    var animal: some View {
        Button {
            emojis[2].shuffle()
            whichEmoji = 2
            emojiCount = Int.random(in: 4..<emojis[2].count)
        } label: {
            VStack {
                Image(systemName: "pawprint.fill")
                Text("animal").font(.body)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius:20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
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
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
