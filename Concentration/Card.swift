//
//  Card.swift
//  Concentration
//
//  Created by jeffrey chiang on 9/25/19.
//  Copyright © 2019 Jeffrey  Chiang . All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0;
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
