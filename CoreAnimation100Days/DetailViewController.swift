//
//  DetailViewController.swift
//  CoreAnimation100Days
//
//  Created by UetaMasamichi on 2015/05/30.
//  Copyright (c) 2015年 Masamichi Ueta. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var dayNumber: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let classString = "Day\(dayNumber)View"
        
        if let objClass = NSClassFromString(classString) as? NSObject.Type {
            let viewClass = objClass as! UIView.Type
            let dayView = viewClass(frame: CGRect(origin: CGPointZero, size: CGSize(width: self.view.bounds.width, height: self.view.bounds.height)))
            self.view.addSubview(dayView)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

