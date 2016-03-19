//
//  ViewController.swift
//  ex2
//
//  Created by Mark Silvis on 3/18/16.
//  Copyright © 2016 Mark Silvis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTextField.placeholder = "Input string"
        self.mainLabel.numberOfLines = 0
        self.mainLabel.text = "0 characters"
    }

    @IBAction func onKeypress(sender: UITextField) {
        let count = self.mainTextField.text!.characters.count
        let chars = String(count) + (count==1 ? " character" : " characters")
        self.mainLabel.text = chars
    }
}

