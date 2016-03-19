//
//  ViewController.swift
//  ex4
//
//  Created by Mark Silvis on 3/18/16.
//  Copyright © 2016 Mark Silvis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nounField: UITextField!
    @IBOutlet weak var verbField: UITextField!
    @IBOutlet weak var adjectiveField: UITextField!
    @IBOutlet weak var adverbField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayLabel.numberOfLines = 0
        self.nounField.placeholder = "Noun"
        self.verbField.placeholder = "Verb"
        self.adjectiveField.placeholder = "Adjective"
        self.adverbField.placeholder = "Adverb"
        self.enterButton.enabled = false
    }
    
    @IBAction func enter(sender: UIButton!) {
        let noun = stripWhitespace(nounField.text!)
        let verb = stripWhitespace(verbField.text!)
        let adjective = stripWhitespace(adjectiveField.text!)
        let adverb = stripWhitespace(adverbField.text!)

        let madLib = "Do you \(verb) your \(adjective) \(noun) \(adverb)? That's hilarious!"
        self.displayLabel.text = madLib
    }

    @IBAction func allFieldsFilled(sender: UITextField) {
        let nounCount = stripWhitespace(nounField.text!).characters.count
        let verbCount = stripWhitespace(verbField.text!).characters.count
        let adjCount = stripWhitespace(adjectiveField.text!).characters.count
        let advCount = stripWhitespace(adverbField.text!).characters.count
        
        if nounCount > 0 && verbCount > 0 && adjCount > 0 && advCount > 0 {
            self.enterButton.enabled = true
        } else {
            self.enterButton.enabled = false
        }
    }
    
    func stripWhitespace(str: String) -> String {
        return str.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
}

