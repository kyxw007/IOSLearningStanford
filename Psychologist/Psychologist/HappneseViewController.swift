//
//  HappneseViewController.swift
//  Psychologist
//
//  Created by WangBen on 16/4/22.
//  Copyright © 2016年 WangBen. All rights reserved.
//

import UIKit

class HappneseViewController: UIViewController {

    var displayValue:String = "Happy";
    override func viewDidLoad() {
        super.viewDidLoad()
        FeelingLabel.text = displayValue
        
    }
    @IBOutlet weak var FeelingLabel: UILabel!
    
}