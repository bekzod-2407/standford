//
//  Concentration.swift
//  standford
//
//  Created by Bekzod Qahhorov on 21/07/22.
//

import Foundation

class Concentration {
 
    var cards = [Card]()
    
    func  chooseCard(at index: Int) {
        
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]  //in cycle create card and append in array 
        }
    }
}