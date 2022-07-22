//
//  Concentration.swift
//  standford
//
//  Created by Bekzod Qahhorov on 21/07/22.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func  chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index { // one card face up
               if cards[matchIndex].id == cards[index].id { //two cards cards faceup and match
                    cards[matchIndex].isMatched = true //
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numberOfpairsOfCards: Int) {
        for _ in 1...numberOfpairsOfCards {
            let card = Card()
            cards += [card , card]
            
        }
        
    }
}
