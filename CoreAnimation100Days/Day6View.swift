//
//  Day6View.swift
//  CoreAnimation100Days
//
//  Created by UetaMasamichi on 2015/06/05.
//  Copyright (c) 2015年 Masamichi Ueta. All rights reserved.
//

import UIKit

@objc(Day6View)
@IBDesignable class Day6View: UIView {
    
    var gradientLayer: CAGradientLayer!
    var circleProgressLayer: CAShapeLayer!
    var circleBackLayer: CAShapeLayer!
    var circleCenter: CGPoint!
    var currentRate: CGFloat = 0
    
    var timer: NSTimer!
    var progress: CGFloat = 0.0
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var gradientView: UIView!
    
    @IBOutlet weak var rateLabel: UILabel!
    
    @IBInspectable var circleRadius: CGFloat = CGFloat(100)
    
    @IBInspectable var gradientStartColor: UIColor = UIColor(red: 217 / 255.0, green: 69 / 255.0, blue: 74.0 / 255.0, alpha: 1.0)
    
    @IBInspectable var gradientEndColor: UIColor = UIColor(red: 204.0 / 255.0, green: 104.0 / 255.0, blue: 58.0 / 255.0, alpha: 1.0)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func prepareForInterfaceBuilder() {
        circleCenter = CGPoint(x: self.center.x , y: 200)
        drawBackgoundGradient()
        drawBackCircle()
        drawProgressCircle()
    }
    
    override func drawRect(rect: CGRect) {
        circleCenter = CGPoint(x: self.center.x , y: 200)
        drawBackgoundGradient()
        drawBackCircle()
        drawProgressCircle()
    }
    
    func drawBackgoundGradient() {
        
        if gradientLayer == nil {
            
            gradientLayer = CAGradientLayer()
            let colors = [gradientStartColor.CGColor, gradientEndColor.CGColor]
            let locations:[CGFloat] = [0.0, 1.0]
            let space = CGColorSpaceCreateDeviceRGB()
            let gradient = CGGradientCreateWithColors(space, colors, locations)
            gradientLayer.colors = colors
            gradientLayer.locations = locations
            gradientLayer.frame = CGRect(origin: CGPointZero, size: CGSize(width: self.bounds.width, height: self.bounds.height / 2.0))
            gradientView.layer.insertSublayer(gradientLayer, atIndex: 0)
        }
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
            gradientView.layer.addSublayer(circleBackLayer)
        }
    }
    
    func drawProgressCircle() {
        if circleProgressLayer == nil {
            circleProgressLayer = CAShapeLayer()
            
            var startAngle = CGFloat(-M_PI_2)
            var endAngle = CGFloat(M_PI + M_PI_2)
            let path = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            circleProgressLayer.path = path.CGPath
            circleProgressLayer.lineWidth = 20.0
            circleProgressLayer.lineCap = "round"
            circleProgressLayer.strokeColor = UIColor.whiteColor().CGColor
            circleProgressLayer.fillColor  = nil
            circleProgressLayer.strokeStart = 0.0
            circleProgressLayer.strokeEnd = progress
            gradientView.layer.addSublayer(circleProgressLayer)
        }
    }
    
    func animate() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = progress
        animation.duration = NSTimeInterval(progress * 1.5)
        animation.delegate = self
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        self.circleProgressLayer.strokeEnd = progress
        self.circleProgressLayer.addAnimation(animation, forKey: "Progress")
        timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(CGFloat(animation.duration) / (progress * 100)), target: self, selector: "updateText:", userInfo: nil, repeats: true)
        
    }
    
    func updateText(timer: NSTimer) {
        
        if currentRate >= progress * 100 {
            timer.invalidate()
            return
        }
        
        currentRate++
        
        if currentRate % 2 == 0 || currentRate == progress * 100 - 1 {
            rateLabel.text = "\(currentRate)%"
        }
        
    }
}