//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Egor Ukolov on 10.06.2023.
//

import Foundation

class ConcentrationGame {
    
    private(set) var cards = [Card]()
    
    private var indexOfOnAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard (at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            } else {
                indexOfOnAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberPairsOfCards: Int) {
        assert(numberPairsOfCards > 0, "Concentration.init(\(numberPairsOfCards): must have at least one pair of cards")
        for _ in 1...numberPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
            //  иной вариант записи
            //  cards += [card,card]
        }
    }
}
