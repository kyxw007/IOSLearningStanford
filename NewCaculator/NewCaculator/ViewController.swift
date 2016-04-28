//
//  ViewController.swift
//  NewCaculator
//
//  Created by WangBen on 16/4/17.
//  Copyright © 2016年 WangBen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsInTheMinOfType = false

    @IBOutlet weak var display: UILabel!
    
    var brain = CalculatorModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numButton(sender: UIButton) {
        let num = sender.currentTitle!

        if userIsInTheMinOfType {
           display.text = display.text!+num
        }else{
            display.text = num
            userIsInTheMinOfType = true
        }
    }

    @IBAction func clear() {
        displayValue = 0
        userIsInTheMinOfType = false
        brain.clear()
    }
    
    @IBAction func enter() {
        userIsInTheMinOfType = false
        if let result = self.brain.pushOperand(displayValue){
            displayValue = result
        }else{
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = String(newValue)
            userIsInTheMinOfType = false
        }
    }
    
    //operation
    
    
    @IBAction func operation(sender: UIButton) {
        if userIsInTheMinOfType {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = self.brain.performOperation(operation){
                displayValue = result
            }else{
                displayValue = 0
            }
        }
    }
    
    
   }

