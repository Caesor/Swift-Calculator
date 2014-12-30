//
//  AdvancedCalculator.swift
//  AdvancedCalculator
//
//  Created by zekai on 8/12/14.
//  Copyright (c) 2014 zekai. All rights reserved.
//

import UIKit

class AdvancedCalculator: UIViewController {
    
    var inputString1:String = ""
    
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if inputString1 != "" {
            inputLabel.text = inputString1
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToEasy" {
            let inputString2:String = inputLabel.text!
            var vc = segue.destinationViewController as ViewController
            vc.inputString2 = inputString2
        }
    }
    

    @IBAction func didclicked(sender: UIButton) {
        let value = sender.currentTitle
        
        var param:Double = NSString(string:inputString1).doubleValue
        
        if value == "+/-"{
            param = 0 - param
        }
        else if value == "()" {
            
        }
        else if value == "%" {
            param = param / 100
        }
        else if value == "1/X" {
            param = 1 / param
        }
        else if value == "X^2"{
            param =  param * param
        }
        else if value == "X^3"{
            param = param * param * param
        }
        else if value == "X!"{
            var tem = 1
            for var index = 0; index < Int(param); ++index {
                tem = tem * (index + 1)
            }
            param = Double(tem)
        }
        else if value == "sqrt" {
            param = sqrt(param)
        }
        else if value == "abs" {
            param = abs(param)
        }
        else if value == "cot" {
            param = 1 / tan(param)
        }
        else if value == "ln" {
            param = log(param)
        }
        else if value == "sin" {
            param = sin(param)
        }
        else if value == "cos" {
            param = cos(param)
        }
        else if value == "tan" {
            param = tan(param)
        }
        else if value == "log" {
            param = log(param)
        }
        else if value == "sinh" {
            param = sinh(param)
        }
        else if value == "cosh" {
            param = cosh(param)
        }
        else if value == "tanh" {
            param = tanh(param)
        }
        else if value == "e^x" {
            param = pow(2.71828, param)
        }
        else if value == "asin" {
            param = asin(param)
        }
        else if value == "acos" {
            param = acos(param)
        }
        else if value == "atan" {
            param = atan(param)
        }
        else if value == "Rand" {
            
        }
        inputString1 = "\(param)"
        inputLabel.text = "\(param)"
    }
}
