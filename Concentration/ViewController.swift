//
//  ViewController.swift
//  Concentration
//
//  Created by Egor Ukolov on 30.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    var touches = 0 {
        didSet {
            touchLabel.text = "Touthes: \(touches)"
        }
    }
    
    func flipButton (emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.005070776679, green: 0.5867208838, blue: 0.9988967776, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
        }
    }
    
    let emojiCollection = ["🦊","🐰","🦊","🐰"]
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet var touchLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            flipButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
        
    }
}

