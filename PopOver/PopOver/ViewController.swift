//
//  ViewController.swift
//  PopOver
//
//  Created by WangBen on 16/4/22.
//  Copyright © 2016年 WangBen. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIPopoverPresentationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let showMsg = "娘娘娘娘～～～ \n 千岁千岁千千岁\n ffuehiufwh\n diqoqiwehqiu"
        if let iden = segue.identifier {
            switch iden {
            case "pop":
                if let pvc = segue.destinationViewController as? PopTextViewController {
                    pvc.text = showMsg
                    if let ppc = pvc.popoverPresentationController{
                        ppc.delegate = self
                    }
                }
            default:
                break
            }
        }
        
    }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
   }
