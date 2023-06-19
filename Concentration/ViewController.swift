//
//  ViewController.swift
//  Concentration
//
//  Created by Egor Ukolov on 30.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
   private lazy var game = ConcentrationGame(numberPairsOfCards: numberPairsOfCards)
    
    var numberPairsOfCards: Int {
        return (buttonCollection.count + 1) / 2
    }
    
    private(set) var touches = 0 {
        didSet {
            touchLabel.text = "Touthes: \(touches)"
        }
    }

     
    private var emojiCollection = ["🦊","🐰","🐵","🐻","🐨","🐷","🐼","🐮","🐸"]
    
    private var emojiDictionary = [Int:String]()
    
    private func emojiIdentifier(for card: Card) -> String {
        
        if emojiDictionary[card.identifier] == nil {
            emojiDictionary[card.identifier] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtancion)
        }
        
        if emojiDictionary[card.identifier] != nil {
            //            return emojiDictionary[card.identifier]!
            //        } else {
            //            return "?"
            //        }
            
            // более короткая запись:
           
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    private func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.3336213529, green: 0.573615551, blue: 0.9960562587, alpha: 0) : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
            }
        }
        
    }
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private var touchLabel: UILabel!
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
        
    }
}

// Увеличить размеры эмодзи

extension Int {
    var arc4randomExtancion: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self)) ))
        } else {
            return 0
        }
    }
}
