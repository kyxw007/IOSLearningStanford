//
//  ViewController.swift
//  ScrollView
//
//  Created by WangBen on 16/4/28.
//  Copyright © 2016年 WangBen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "iphone6s":
                    ivc.imageUrl = ImageUrl.iphone6s
                case "ipad":
                    ivc.imageUrl = ImageUrl.ipad
                case "iphonese":
                    ivc.imageUrl = ImageUrl.iphonese
                default: break
                }
            }
        }
        
    }
}

