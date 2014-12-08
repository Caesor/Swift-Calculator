//
//  ViewController.swift
//  AdvancedCalculator
//
//  Created by zekai on 4/12/14.
//  Copyright (c) 2014 zekai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var bigResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var inputString:String = ""
    
    @IBAction func didClicked(sender: UIButton) {
        let value = sender.currentTitle
        
        if bigResult.text != ""{
            bigResult.text = ""
        }
//        print(value)
        if value == "=" {
            //init a calculator class
            let result = calculator(expression: "\(inputString)")
            //call calculate method in calculator
            if result.calculate() == ""{
                resultLabel.text = "This's not a good Math expression\n"
            }
            else{
                bigResult.text = "\(result.calculate())"
                inputString = "\(result.calculate())"
            }
            return
        }
        else if value == "c"{
            inputString.removeAll()
        }
        else if value == "del"{
            if countElements(inputString) > 0{
                inputString = dropLast(inputString)
                print(inputString)
            }
        }
        else{
            inputString += value!
        }
        //update the information on blackboard
        if countElements(inputString) > 0 {
            resultLabel.text = "\(inputString)"
        }
        else{
            resultLabel.text = "0"
        }
    }
}
/**
 * calculator class package the whole method of calculation
 *
 */
class calculator {
    var infix:String = ""
    var postfix = [String]()
    
    //constuctor
    init(expression:String){
        self.infix = expression
    }
    /**
    * To judge the priority of a operator
    *
    * @retrun : the priority of operator
    */
    func checkPro(op:String) -> Int{
        if op == "+" || op == "-"{
            return 1
        }
        else if op == "*" || op == "/"{
            return 2
        }
        else{
            return 3
        }
    }
    
    /**
    * Calculate the math expresion according to Postfix Expression
    *
    * @retrun : a string of result
    */
    func calculate() ->String{
        var solution:String = ""
        if inToPost(){
            print("Postfix: \(postfix)\n")
            var result:Double = 0
            //use a String array to simulate "Stack"
            var stack = [String]()
            
            for eachParam in postfix{
                if eachParam == "+" || eachParam == "-" || eachParam == "*" || eachParam == "/"{
                    var param2 = NSString(string: stack.last!).doubleValue
                    stack.removeLast()
                    var param1 = NSString(string: stack.last!).doubleValue
                    stack.removeLast()
                    switch eachParam{
                    case "+":
                        result = param1 + param2
                    case "-":
                        result = param1 - param2
                    case "*":
                        result = param1 * param2
                    case "/":
                        result = param1 / param2
                    default:
                        result = 0
                    }
                    stack.append("\(result)")
                }
                else{
                    stack.append(eachParam)
                }
            }
            solution = stack.last!
            print("\(stack.last)")
        }
        else{
            print("This's not a good Math expression\n")
            solution = ""
        }
        return solution
    }
    
    /**
    * Transform the math expresstion from Nifix Expression to Postfix Expression
    *
    * @retrun : a bool, True means math expression is correct, otherwise False
    */
    func inToPost() -> Bool{
        var param:String = ""
        //used to store the operators
        var opert = [String]()
        
        var index = 0
        postfix.removeAll()
        
        for eachChar in infix {
            if eachChar == "+" || eachChar == "-" || eachChar == "*" || eachChar == "/"{
                if param != ""{
                    postfix.append(param)
                    param = ""
                }
                else{//the whole string is not a math expression
                    return false
                }
                //To judge pop or not
                while  opert.count > 0 {
                    if checkPro(opert.last!) >= checkPro(String(eachChar)){
                        //pop stack and push to postfix array
                        postfix.append(opert.last!)
                        opert.removeLast()
                    }
                    else{
                        break
                    }
                }
                opert.append("\(eachChar)")
            }
            else{
                param += "\(eachChar)"
            }
            ++index
            //at the end of infix
            if index == countElements(infix){
                //the whole string is not a math expression
                if param == ""{
                    return false
                }
                postfix.append(param)
                while opert.count > 0 {
                    postfix.append(opert.last!)
                    opert.removeLast()
                }
            }
        }
        return true
    }
    
}



