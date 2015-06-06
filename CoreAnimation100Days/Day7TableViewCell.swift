//
//  Day7TableViewCell.swift
//  CoreAnimation100Days
//
//  Created by UetaMasamichi on 2015/06/06.
//  Copyright (c) 2015年 Masamichi Ueta. All rights reserved.
//

import UIKit

class Day7TableViewCell: UITableViewCell {
    
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func drawRect(rect: CGRect) {
        
        let path = UIBezierPath()
        path.lineWidth = 1.0
        UIColor(red: 189.0 / 255.0, green: 178.0 / 255.0, blue: 166.0 / 255.0, alpha: 1.0).setStroke()
        path.moveToPoint(CGPoint(x: self.bounds.width / 2.0, y: 0))
        path.addLineToPoint(CGPoint(x: self.bounds.width / 2.0, y: (self.bounds.height - iconImageView.bounds.height) / 2.0))
        
        path.stroke()
        
        path.moveToPoint(CGPoint(x: self.bounds.width / 2.0, y: (self.bounds.height + iconImageView.bounds.height) / 2.0))
        path.addLineToPoint(CGPoint(x: self.bounds.width / 2.0, y: self.bounds.height))
        path.stroke()
        
        super.drawRect(rect)
    }
    
}
