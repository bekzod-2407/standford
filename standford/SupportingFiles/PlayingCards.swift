//
//  PlayingCards.swift
//  standford
//
//  Created by Bekzod Qahhorov on 29/07/22.
//

import Foundation

struct PlayingCard: CustomStringConvertible{
    var description: String  {return "\(rank)\(suit)"}
    
    
    var suit: Suit
    var rank: Rank
    
    enum Suit:String, CustomStringConvertible {
        var description: String  {return ""}
        
        case spades =  "♤"
        case heart = "♡"
        case clubs = "♧"
        case diamonds = "♢"
        
        static var all = [Suit.spades, .heart, .clubs, .diamonds] 
    }
    
    enum Rank: CustomStringConvertible {
        var description: String  {return ""}
        
        case ace
        case fase(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .fase(let king) where king == "J" : return 11
            case .fase(let king) where king == "Q" : return 12
            case .fase(let king) where king == "K" : return 13
            case .numeric(let pips): return pips
            default: return 0
            }
        }
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks +=  [Rank.fase("J"),.fase("Q"),.fase("K")]
            return allRanks
        }
    }
    
    
}
