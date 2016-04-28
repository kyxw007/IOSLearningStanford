//
//  ViewController.swift
//  AutoLayout
//
//  Created by WangBen on 16/4/28.
//  Copyright © 2016年 WangBen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var companyLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var aspectRatioConstrain: NSLayoutConstraint? {
        willSet {
            if let exisitingConstraint = aspectRatioConstrain {
                view.removeConstraint(exisitingConstraint)
            }
        }
        didSet {
            if let newContraint = aspectRatioConstrain {
                view.addConstraint(newContraint)
            }
        }
    }
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            if let constrainView = imageView {
                if let newImage = newValue {
                    aspectRatioConstrain = NSLayoutConstraint(
                        item: constrainView,
                        attribute: .Width,
                        relatedBy: .Equal,
                        toItem: constrainView,
                        attribute: .Height,
                        multiplier: newImage.aspectRatio,
                        constant: 0)
                }else{
                    aspectRatioConstrain = nil
                }
                
            }
        }
    }
    
    
    var  loginUser: User? {
        didSet{
            updateUI()
        }
    }
    
    
    @IBAction func doLogin() {
        loginUser = User.login(loginField.text ?? "", password: passwordField.text ?? "")
    }
  
    private func updateUI(){
        nameLabel.text = loginUser?.name
        companyLabel.text = loginUser?.company
        image = loginUser?.image
    }
    
    override func viewDidLoad() {
        image = nil
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        loginField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
}

extension User{

    var image: UIImage?{
        if let image = UIImage(named: login){
            return image
        }else{
            return UIImage(named:"unkonw")
        }
    }
}

extension UIImage {
    var aspectRatio: CGFloat {
        return size.height != 0 ? size.width / size.height : 0
    }
}
