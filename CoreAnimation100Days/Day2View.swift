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

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    func configureView() {
        
    }
    
    override func drawRect(rect: CGRect) {
        drawBackgoundGradient()
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

}
