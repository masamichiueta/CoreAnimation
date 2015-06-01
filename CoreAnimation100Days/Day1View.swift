//
//  Day1View.swift
//  CoreAnimation100Days
//
//  Created by UetaMasamichi on 2015/05/31.
//  Copyright (c) 2015年 Masamichi Ueta. All rights reserved.
//

import UIKit

@objc(Day1View)
class Day1View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    func configureView() {
        self.opaque = false
        
    }
    
    

    override func drawRect(rect: CGRect) {
        
    }
    
}
