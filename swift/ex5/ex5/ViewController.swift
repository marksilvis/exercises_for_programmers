//
//  ViewController.swift
//  ex5
//
//  Created by Mark Silvis on 3/18/16.
//  Copyright © 2016 Mark Silvis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNumberField: UITextField!
    @IBOutlet weak var secondNumberField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayLabel.numberOfLines = 0
        self.firstNumberField.placeholder = "First number"
        self.secondNumberField.placeholder = "Second number"
        self.firstNumberField.keyboardType = .DecimalPad
        self.secondNumberField.keyboardType = .DecimalPad
        self.enterButton.enabled = false
    }
    
    @IBAction func enableEnterButton(sender: UITextField) {
        if !(self.firstNumberField.text!.isEmpty || self.secondNumberField.text!.isEmpty) {
            self.enterButton.enabled = true
        } else {
            self.enterButton.enabled = false
        }
    }
    
    @IBAction func enter(sender: UIButton) {
        let firstNumber = Float(self.firstNumberField.text!)
        let secondNumber = Float(self.secondNumberField.text!)
        showMath(firstNumber!, second: secondNumber!)
    }
    
    func showMath(first: Float, second: Float) {
        self.displayLabel.text = addition(first, second)
        self.displayLabel.text = self.displayLabel.text! + "\n" + subtraction(first, second)
        self.displayLabel.text = self.displayLabel.text! + "\n" + multiplication(first, second)
        self.displayLabel.text = self.displayLabel.text! + "\n" + division(first, second)
    }
    
    func addition(first: Float, _ second: Float) -> String {
        let text = "\(first) + \(second) = "
        let sum = first + second
        if isInt(sum) {
            let int = Int(sum)
            return text + String(int)
        } else {
            return text + String(sum)
        }
    }
    
    func subtraction(first: Float, _ second: Float) -> String {
        let text = "\(first) - \(second) = "
        let diff = first - second
        if isInt(diff) {
            let int = Int(diff)
            return text + String(int)
        } else  {
            return text + String(diff)
        }
    }
    
    func multiplication(first: Float, _ second: Float) -> String {
        let text = "\(first) * \(second) = "
        let prod = first * second
        if isInt(prod) {
            let int = Int(prod)
            return text + String(int)
        } else {
            return text + String(prod)
        }
    }
    
    func division(first: Float, _ second: Float) -> String {
        let text = "\(first) / \(second) = "
        let quot = first / second
        if isInt(quot) {
            let int = Int(quot)
            return text + String(int)
        } else {
            return text + String(quot)
        }
    }
    
    func isInt(num: Float) -> Bool {
        return floor(num) == num
    }
}
