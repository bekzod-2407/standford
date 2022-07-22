//
//  Card.swift
//  standford
//
//  Created by Bekzod Qahhorov on 21/07/22.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var id: Int
    static var  identifierFactory = 0
    
   static func getIdentifier() -> Int {
       identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.id = Card.getIdentifier()
    }
}
