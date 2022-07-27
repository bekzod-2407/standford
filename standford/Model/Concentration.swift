//
//  Concentration.swift
//  standford
//
//  Created by Bekzod Qahhorov on 21/07/22.
//

import Foundation

struct Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp =  (index == newValue)
            }
        }
    }
    
    mutating func  chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index { // one card face up
               if cards[matchIndex] == cards[index] { //two cards cards faceup and match
                    cards[matchIndex].isMatched = true //
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
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
extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
