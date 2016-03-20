//
//  ViewController.swift
//  ex7
//
//  Created by Mark Silvis on 3/19/16.
//  Copyright © 2016 Mark Silvis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lengthField: UITextField!
    @IBOutlet weak var widthField: UITextField!
    @IBOutlet weak var unitPicker: UISegmentedControl!
    @IBOutlet weak var feetAreaLabel: UILabel!
    @IBOutlet weak var meterAreaLabel: UILabel!
    let conversion: Float = 0.09290304
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showArea(sender: AnyObject) {
        let length = getLength()
        let width = getWidth()
        let unit = getUnit()
        let area = length*width
        
        if unit == "meters" {
            let converted = area/conversion
            setMeters(area)
            setFeet(converted)
        } else {
            let converted = area*conversion
            setFeet(area)
            setMeters(converted)
        }
    }
    
    func getLength() -> Float {
        let text = self.lengthField.text!
        return (text.characters.count == 0 ? 0 : Float(text)!)
    }
    
    func getWidth() -> Float {
        let text = self.widthField.text!
        return (text.characters.count == 0 ? 0 : Float(text)!)
    }
    
    func getUnit() -> String {
        return self.unitPicker.titleForSegmentAtIndex(self.unitPicker.selectedSegmentIndex)!
    }
    
    func setFeet(area: Float) {
        self.feetAreaLabel.text = "\(String(area)) sq. feet"
    }
    
    func setMeters(area: Float) {
        self.meterAreaLabel.text = "\(String(area)) sq. meters"
    }
}

