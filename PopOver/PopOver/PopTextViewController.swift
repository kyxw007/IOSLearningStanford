//
//  PopTextViewController.swift
//  PopOver
//
//  Created by WangBen on 16/4/22.
//  Copyright © 2016年 WangBen. All rights reserved.
//

import UIKit

class PopTextViewController: UIViewController {

    @IBOutlet weak var textview: UITextView! {
        didSet{
            textview?.text = text
        }
    }
    var  text: String = "" {
        didSet{
            textview?.text = text
        }
    }
    
    override var preferredContentSize: CGSize {
        get {
            if textview != nil && presentingViewController != nil{
                return textview.sizeThatFits(presentingViewController!.view.bounds.size)
            }else{
                return super.preferredContentSize
            }
        }
        set{
            super.preferredContentSize = newValue
        }
    }
   
}
