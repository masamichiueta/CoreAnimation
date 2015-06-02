//
//  Day3View.swift
//  CoreAnimation100Days
//
//  Created by UetaMasamichi on 2015/06/02.
//  Copyright (c) 2015年 Masamichi Ueta. All rights reserved.
//

import UIKit

@objc(Day3View)
@IBDesignable class Day3View: UIView {
    
    var circleProgressLayer: CAShapeLayer!
    var circleBackLayer: CAShapeLayer!
    
    let circleRadius = CGFloat(100)
    var circleCenter: CGPoint!
    
    var currentTime = 0
    
    @IBInspectable var gradientStartColor: UIColor = UIColor(red: 217 / 255.0, green: 69 / 255.0, blue: 74.0 / 255.0, alpha: 1.0) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var gradientEndColor: UIColor = UIColor(red: 204.0 / 255.0, green: 104.0 / 255.0, blue: 58.0 / 255.0, alpha: 1.0) {
        didSet {
            updateView()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    
    override func prepareForInterfaceBuilder() {
        updateView()
    }
    
    func configureView() {
        circleCenter = CGPoint(x: self.center.x , y: 200)
    }
    
    func updateView() {
        
    }

    
    override func drawRect(rect: CGRect) {
        drawBackgoundGradient()
        drawBackCircle()
        drawProgressCircle()
        drawTimeText()
    }
    
    func drawBackgoundGradient() {
        let ctx = UIGraphicsGetCurrentContext()
        
        CGContextSaveGState(ctx)
        let colors = [gradientStartColor.CGColor, gradientEndColor.CGColor]
        let locations:[CGFloat] = [0.0, 1.0]
        let space = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradientCreateWithColors(space, colors, locations)
        CGContextDrawLinearGradient(ctx, gradient, CGPointZero, CGPoint(x: 0, y: self.bounds.height / 2.0), CGGradientDrawingOptions.allZeros)
        CGContextRestoreGState(ctx)
    }
    
    func drawBackCircle() {
        if circleBackLayer == nil {
            circleBackLayer =  CAShapeLayer()
            let path = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: true)
            circleBackLayer.path = path.CGPath
            circleBackLayer.strokeColor = UIColor.blackColor().CGColor
            circleBackLayer.opacity = 0.1
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
    
    func drawTimeText() {
        var currentTimeStr: NSString = "2:50"
        
        let fieldColor: UIColor = UIColor.whiteColor()
        let fieldFont = UIFont(name: "Helvetica Neue", size: 60)
        var paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = .Center
        
        var attributes = [
            NSForegroundColorAttributeName: fieldColor,
            NSParagraphStyleAttributeName: paraStyle,
            NSFontAttributeName: fieldFont!
        ]
        
        let fontHeight = fieldFont!.pointSize
        
        // Calculate the rectangle to draw text
        let rect = CGRect(x: circleCenter.x - circleRadius, y: circleCenter.y - fontHeight / 2.0, width: circleRadius * 2, height: fontHeight)
        
        currentTimeStr.drawInRect(rect, withAttributes: attributes)
    }
    
}
