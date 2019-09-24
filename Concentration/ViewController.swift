//
//  ViewController.swift
//  Concentration
//
//  Created by Jeffrey  Chiang  on 9/20/19.
//  Copyright © 2019 Jeffrey  Chiang . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCardNum: Int = 0 {
        didSet {
            flipNumLable.text = "Flips : \(flipCardNum)"
        }
    }
    
    @IBOutlet weak var flipNumLable: UILabel!
    
    @IBOutlet var cardsButtons: [UIButton]!
    
    var emojisChoices = ["👻", "🎃", "👻", "🎃", "🥧", "🧛‍♂️", "🧛‍♀️", "🥧", "🧛‍♂️", "🧛‍♀️"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardsButtons.index(of: sender){
            flipCard(withEmoji: emojisChoices[cardNumber], on: sender)
        } else {
            print("chosen card was not in cardButtons")
        }

    }

    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        flipCardNum += 1
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
    


}

