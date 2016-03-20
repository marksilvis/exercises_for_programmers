//
//  ViewController.swift
//  ex6
//
//  Created by Mark Silvis on 3/19/16.
//  Copyright © 2016 Mark Silvis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var retireField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var retireMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.enterButton.enabled = false
    }
    
    @IBAction func calcRetirement(sender: UIButton) {
        let age = Int(ageField.text!)!
        let retireAge = Int(retireField.text!)!
        let yearsToRetire = retireAge - age
        
        // show message
        var message: String
        if yearsToRetire < 0 {
            let year = getYear()
            let couldveRetiredYear = year + yearsToRetire
            message = "You could have retired in \(couldveRetiredYear)."
        } else if yearsToRetire == 0 {
            message = "Good news, you can retire this year!"
        } else if yearsToRetire == 1 {
            let year = getYear()
            let retirementYear = year.successor()
            message = "You have 1 year left until you can retire." +
                      "\nIt's \(year), so you can retire in \(retirementYear)."
        } else {
            let year = getYear()
            let retirementYear = year + yearsToRetire
            message = "You have \(yearsToRetire) years left until you can retire" +
                      "\nIt's \(year), so you can retire in \(retirementYear)."
        }
        self.retireMessage.text = message
    }
    
    @IBAction func areRequiredFieldsFilled(sender: UITextField) {
        let ageCount = self.ageField.text!.characters.count
        let retireCount = self.retireField.text!.characters.count
        
        if ageCount > 0 && retireCount > 0 {
            self.enterButton.enabled = true
        } else {
            self.enterButton.enabled = false
        }
    }
    
    func getYear() -> Int {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Year, fromDate: date)
        
        return components.year
    }
}

