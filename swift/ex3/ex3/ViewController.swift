//
//  ViewController.swift
//  ex3
//
//  Created by Mark Silvis on 3/18/16.
//  Copyright © 2016 Mark Silvis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteField: UITextField!
    @IBOutlet weak var authorField: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // display label
        self.displayLabel.numberOfLines = 0
        
        // quote field
        self.quoteField.placeholder = "Quote"
        self.quoteField.layer.borderWidth = 1
        self.quoteField.layer.cornerRadius = 8.0

        // author field
        self.authorField.placeholder = "Author"
        self.authorField.layer.borderWidth = 1
        self.authorField.layer.cornerRadius = 8.0
    }

    @IBAction func enter(sender: AnyObject) {
        let author = stripWhitespace(self.authorField.text!)
        let quote = stripWhitespace(self.quoteField.text!)
        let displayText = "\(author) says, \"\(quote)\""
        
        if !isMissingRequiredField(quote, author: author) {
            self.displayLabel.text = displayText
        }
    }
    
    func isMissingRequiredField(quote: String, author: String) -> Bool {
        if quote.characters.count == 0 {
            self.quoteField.layer.borderColor = UIColor.redColor().CGColor
            return true;
        }
        if author.characters.count == 0 {
            self.authorField.layer.borderColor = UIColor.redColor().CGColor
            return true;
        }
        return false;
    }
    
    func stripWhitespace(str: String) -> String {
        return str.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
}

