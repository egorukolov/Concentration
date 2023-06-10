//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Egor Ukolov on 10.06.2023.
//

import Foundation

class ConcentrationGame {
    
    var cards = [Card]()
    
    var indexOfOnAndOnlyFaceUpCard: Int?
    
    func chooseCard (at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOnAndOnlyFaceUpCard = nil
                
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOnAndOnlyFaceUpCard =  index
            }
        }
    }
    
    init(numberPairsOfCards: Int) {
        for _ in 1...numberPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
            //  иной вариант записи
            //  cards += [card,card]
        }
    }
}
