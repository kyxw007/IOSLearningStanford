//
//  FaceView.swift
//  FaceView
//
//  Created by WangBen on 16/4/22.
//  Copyright © 2016年 WangBen. All rights reserved.
//

import UIKit

class FaceView: UIView {
    
    var mood: Int = 50 {
        didSet{
            let moodStandard = min(max(mood, 0),100)
            smileIndex = (Double(moodStandard) - 50.0)/50.0
        }
    }
    
    var smileIndex : Double = 0 { didSet{ setNeedsDisplay() }}
    
    var lineWitdh:CGFloat = 3 { didSet{ setNeedsDisplay() }}
    
    var color: UIColor = UIColor.yellowColor() { didSet{ setNeedsDisplay() }}
    
    var faceCenter : CGPoint{
        return convertPoint(center, fromView: superview)
    }
    
    var faceRadius: CGFloat{
        return min(bounds.size.height, bounds.size.width) / 4
    }

    override func drawRect(rect: CGRect) {
        let facePath = UIBezierPath(arcCenter: faceCenter, radius: faceRadius, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        facePath.lineWidth = lineWitdh
        color.set()
        facePath.stroke()
        
        //draw eyes 
        var lefteyeCenter = CGPoint()
        lefteyeCenter.x = faceCenter.x - faceRadius/2.5
        lefteyeCenter.y = faceCenter.y - faceRadius/2.5
        let leftEyePath = UIBezierPath(arcCenter: lefteyeCenter, radius: faceRadius/10, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        leftEyePath.lineWidth = lineWitdh/1.5
        color.set()
        leftEyePath.stroke()
        
        var righteyeCenter = CGPoint()
        righteyeCenter.x = faceCenter.x + faceRadius/2.5
        righteyeCenter.y = faceCenter.y - faceRadius/2.5
        let rightEyePath = UIBezierPath(arcCenter: righteyeCenter, radius: faceRadius/10, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        rightEyePath.lineWidth = lineWitdh/1.5
        color.set()
        rightEyePath.stroke()
        
        //draw smile
        bezierFacePath(smileIndex).stroke()

        
    }
    
    private func bezierFacePath (fractionOfMaxSmile:Double) -> UIBezierPath{
        let mouthWitdh = faceRadius/1
        let mouthHeight = faceRadius/2.5
        let mouthVerticalOffset = faceRadius/3
        let smileHeight = CGFloat (max(min(fractionOfMaxSmile, 1), -1)) * mouthHeight
        
        let start = CGPoint(x: faceCenter.x - mouthWitdh/2, y: faceCenter.y + mouthVerticalOffset)
        let end = CGPoint(x: start.x + mouthWitdh, y: start.y)
        let cp1 = CGPoint(x: start.x + mouthWitdh / 3, y: start.y + smileHeight)
        let cp2 = CGPoint(x: end.x - mouthWitdh / 3, y: cp1.y)
        
        let path = UIBezierPath()
        path.moveToPoint(start)
        path.addCurveToPoint(end, controlPoint1: cp1, controlPoint2: cp2)
        path.lineWidth = lineWitdh/1.5
        return path
    }

}
