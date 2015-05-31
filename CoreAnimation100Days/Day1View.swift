//
//  Day1View.swift
//  CoreAnimation100Days
//
//  Created by UetaMasamichi on 2015/05/31.
//  Copyright (c) 2015年 Masamichi Ueta. All rights reserved.
//

import UIKit

class Day1View: UIView {

    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), cornerRadius: 5.0)
        path.lineCapStyle = kCGLineCapRound
        path.lineWidth = 3.0
        UIColor.redColor().setStroke()
        path.stroke()
    }

}
