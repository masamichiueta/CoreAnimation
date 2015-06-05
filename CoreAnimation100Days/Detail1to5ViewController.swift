//
//  Detail1to5ViewController.swift
//  CoreAnimation100Days
//
//  Created by UetaMasamichi on 2015/06/05.
//  Copyright (c) 2015年 Masamichi Ueta. All rights reserved.
//

import UIKit

class Detail1to5ViewController: DetailViewController {

    var dayNumber: Int = 1
    var dayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let classString = "Day\(dayNumber)View"
        
        if let nibFile = NSBundle.mainBundle().pathForResource(classString, ofType: "nib") {
            let nib = NSBundle.mainBundle().loadNibNamed(classString, owner: nil, options: nil)
            dayView = nib[0] as! UIView
            dayView.frame = CGRect(origin: CGPointZero, size: CGSize(width: self.view.bounds.width, height: self.view.bounds.height))
            dayView.setNeedsDisplay()
            self.view.addSubview(dayView)
        } else if let objClass = NSClassFromString(classString) as? NSObject.Type {
            let viewClass = objClass as! UIView.Type
            dayView = viewClass(frame: CGRect(origin: CGPointZero, size: CGSize(width: self.view.bounds.width, height: self.view.bounds.height)))
            self.view.addSubview(dayView)
        }
    }

    override func viewDidAppear(animated: Bool) {
        
        switch dayView {
        case dayView as Day4View:
            let _dayView = dayView as! Day4View
            _dayView.progress = 0.8
            _dayView.animate()
        case dayView as Day5View:
            let _dayView = dayView as! Day5View
            _dayView.progress = 0.6
            _dayView.animate()
        default:
            break
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
