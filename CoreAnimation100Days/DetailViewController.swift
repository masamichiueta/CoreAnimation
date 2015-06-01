//
//  DetailViewController.swift
//  CoreAnimation100Days
//
//  Created by UetaMasamichi on 2015/05/30.
//  Copyright (c) 2015年 Masamichi Ueta. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var dayView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let dayView = dayView {
            self.view.addSubview(dayView)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

