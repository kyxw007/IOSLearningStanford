//
//  FaceViewController.swift
//  FaceView
//
//  Created by WangBen on 16/4/22.
//  Copyright © 2016年 WangBen. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {

    override func viewDidLoad() {
        moodScoreTextField.keyboardType = UIKeyboardType.NumberPad
    }
    @IBOutlet weak var faceView: FaceView!
    
    @IBOutlet weak var moodScoreTextField: UITextField!
    
    @IBAction func trySmile() {
        if let score = Int(moodScoreTextField.text!){
            faceView.mood = score
        }else{
            faceView.mood = 60
        }
        
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        moodScoreTextField.resignFirstResponder()
    }
    
}
