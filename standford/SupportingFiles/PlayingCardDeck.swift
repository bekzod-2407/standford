//
//  PlayingCardDeck.swift
//  standford
//
//  Created by Bekzod Qahhorov on 29/07/22.
//

import Foundation

struct PlayingCardsDeck
{
    private(set) var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4randomExtension)
        } else {
            return nil
        }
    }
}

