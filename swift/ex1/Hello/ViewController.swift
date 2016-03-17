//
//  ViewController.swift
//  Hello
//
//  Created by Mark Silvis on 3/16/16.
//  Copyright © 2016 Mark Silvis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTextField.placeholder = "Name"
        self.mainLabel.numberOfLines = 0
    }

    @IBAction func entered(sender: AnyObject) {
        let name = self.mainTextField.text!
        let greeting = "Hello, \(name), nice to meet you!"
        self.mainLabel.text = greeting
    }
}

