//
//  ViewController.swift
//  Concentration
//
//  Created by Jeffrey  Chiang  on 9/20/19.
//  Copyright © 2019 Jeffrey  Chiang . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardsButtons.count + 1) / 2)
    
    var flipCardNum: Int = 0 {
        didSet {
            flipNumLable.text = "Flips : \(flipCardNum)"
        }
    }
    
    @IBOutlet weak var flipNumLable: UILabel!
    
    @IBOutlet var cardsButtons: [UIButton]!
    
    var emojisChoices = ["👻", "🎃", "🥧", "🧛‍♂️", "🧛‍♀️"]
    var emoji = [Int:String]()
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCardNum += 1
        if let cardNumber = cardsButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }

    }
    
    func updateViewFromModel(){
        for index in cardsButtons.indices{
            let button = cardsButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojisChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojisChoices.count)))
                emoji[card.identifier] = emojisChoices.remove(at: randomIndex)
            }
        return emoji[card.identifier] ?? "?"
    }
}
