//
//  Day2View.swift
//  CoreAnimation100Days
//
//  Created by UetaMasamichi on 2015/06/01.
//  Copyright (c) 2015年 Masamichi Ueta. All rights reserved.
//

import UIKit

@objc(Day2View)
class Day2View: UIView {
    
    var circleProgressLayer: CAShapeLayer!
    var circleBackLayer: CAShapeLayer!
    
    let circleRadius = CGFloat(100)
    var circleCenter: CGPoint!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    func configureView() {
        circleCenter = CGPoint(x: self.center.x , y: 200)
    }
    
    override func drawRect(rect: CGRect) {
        drawBackgoundGradient()
        drawBackCircle()
        drawProgressCircle()
    }
    
    func drawBackgoundGradient() {
        let ctx = UIGraphicsGetCurrentContext()
        
        CGContextSaveGState(ctx)
        let startColor = UIColor(red: 194.0 / 255.0, green: 70.0 / 255.0, blue: 70.0 / 255.0, alpha: 1.0)
        let endColor = UIColor(red: 204.0 / 255.0, green: 104.0 / 255.0, blue: 58.0 / 255.0, alpha: 1.0)
        let colors = [startColor.CGColor, endColor.CGColor]
        let locations:[CGFloat] = [0.0, 1.0]
        let space = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradientCreateWithColors(space, colors, locations)
        CGContextDrawLinearGradient(ctx, gradient, CGPointZero, CGPoint(x: 0, y: self.bounds.height), CGGradientDrawingOptions.allZeros)
        CGContextRestoreGState(ctx)
    }
    
    func drawBackCircle() {
        if circleBackLayer == nil {
            circleBackLayer =  CAShapeLayer()
            let path = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: true)
            circleBackLayer.path = path.CGPath
            circleBackLayer.strokeColor = UIColor.darkGrayColor().CGColor
            circleBackLayer.opacity = 0.5
            circleBackLayer.fillColor = nil
            circleBackLayer.lineWidth = 20.0
            self.layer.addSublayer(circleBackLayer)
        }
    }
    
    func drawProgressCircle() {
        if circleProgressLayer == nil {
            circleProgressLayer = CAShapeLayer()
            
            var startAngle = CGFloat(-M_PI_2)
            var endAngle = CGFloat(M_PI_2 * 0.8)
            let path = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            circleProgressLayer.path = path.CGPath
            circleProgressLayer.lineWidth = 20.0
            circleProgressLayer.lineCap = "round"
            circleProgressLayer.strokeColor = UIColor.whiteColor().CGColor
            circleProgressLayer.fillColor  = nil
            self.layer.addSublayer(circleProgressLayer)
        }
        
        
    }

}
