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
    
    func drawCenterLineAtIndexPath(indexPath: NSIndexPath, numberOfRows: Int) {
        let lineColor = UIColor(red: 189.0 / 255.0, green: 178.0 / 255.0, blue: 166.0 / 255.0, alpha: 1.0)
        
        if indexPath.row != 0 {
            let point = CGPoint(x: self.bounds.width / 2.0, y: 0)
            let size = CGSize(width: 2.0, height: (self.bounds.height - iconImageView.bounds.height) / 2.0)
            let upperLineView = UIView(frame: CGRect(origin: point, size: size))
            upperLineView.backgroundColor = lineColor
            self.addSubview(upperLineView)
        }
        
        if indexPath.row != numberOfRows - 1 {
            let point = CGPoint(x: self.bounds.width / 2.0, y: (self.bounds.height + iconImageView.bounds.height) / 2.0)
            let size = CGSize(width: 2.0, height: (self.bounds.height - iconImageView.bounds.height) / 2.0)
            let lowerLineView = UIView(frame: CGRect(origin: point, size: size))
            lowerLineView.backgroundColor = lineColor
            self.addSubview(lowerLineView)
        }
    }
}
