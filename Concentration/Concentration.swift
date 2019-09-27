//
//  Concentration.swift
//  Concentration
//
//  Created by jeffrey chiang on 9/25/19.
//  Copyright © 2019 Jeffrey  Chiang . All rights reserved.
//

import Foundation

class Concentration{
    
    var cards = [Card]()
    var indexOfOnlyOneCardFaceUp: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyOneCardFaceUp, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOnlyOneCardFaceUp = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOnlyOneCardFaceUp = index
            }
        }
        
    }
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        // TODO: suffule the cards
    }
}
