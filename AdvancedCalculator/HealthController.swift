//
//  HealthController.swift
//  AdvancedCalculator
//
//  Created by zekai on 8/12/14.
//  Copyright (c) 2014 zekai. All rights reserved.
//

import UIKit

class HealthController: UIViewController {
    

    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var submitBtn: UIButton!
    //this.label is insert by customed design
    let index = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        submitBtn.layer.cornerRadius = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func heightLabel(sender: UISlider) {
        var value = Int(sender.value)
        height.text = "\(value)"
    }

    @IBAction func weightLabel(sender: UISlider) {
        var value = Int(sender.value)
        weight.text = "\(value)"
    }
    
    @IBAction func submitData(sender: UIButton) {
        let usr_height = NSString(string: height.text!).doubleValue
        let usr_weight = NSString(string: weight.text!).doubleValue
        let usr_sex =  gender.selectedSegmentIndex == 0 ? "male" : "female"
        println(usr_height)
        
//        let showIndex = UILabel()
//        showIndex.text = "\(result)"
//        showIndex.frame = CGRectMake(162, 257, 100, 53)
        
        var result:String = String(format: "%.2f", usr_weight / (usr_height / 100) / (usr_height / 100))
        
        //insert a label
        index.text = "Index:\(result)"
        index.font = UIFont(name:index.font.fontName,size:30)
        index.frame = CGRectMake(60, 250, 200, 100)
        index.layer.zPosition = 100
        index.layer.borderColor = UIColor.blackColor().CGColor
        index.layer.borderWidth = 1
        index.layer.cornerRadius = 10
        index.textAlignment = .Center
        self.view.addSubview(index)
        
    }
}

