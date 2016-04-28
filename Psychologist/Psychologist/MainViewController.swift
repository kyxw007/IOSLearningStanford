//
//  ViewController.swift
//  Psychologist
//
//  Created by WangBen on 16/4/22.
//  Copyright © 2016年 WangBen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
  
    @IBAction func donothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepare segue")
        if let hvc = segue.destinationViewController as? HappneseViewController {
            print("get hvc")
            if let identi = segue.identifier {
                print(identi)
                switch identi {
                case "sad": hvc.displayValue = "Unhappy"
                case "happy": hvc.displayValue = "Happy"
                case "nothing": hvc.displayValue = "Perhaps sad"
                default: hvc.displayValue = "No Feelings"
                }
            }
        }
    }


}

