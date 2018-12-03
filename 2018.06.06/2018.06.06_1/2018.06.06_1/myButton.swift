//
//  myButton.swift
//  2018.06.06_1
//
//  Created by admin on 2018/6/6.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class MyButton: UIButton {
    
    override func awakeFromNib() {
        
        layer.borderWidth = 1
        switch restorationIdentifier {
        case "red":
            layer.borderColor = UIColor.red.cgColor
        case "green":

            layer.borderColor = UIColor.green.cgColor
        default:
            layer.borderColor = nil
        }
        if let color = value(forKeyPath: "layer.borderColor") as? UIColor {
            layer.borderColor = color.cgColor
        
        }else {
            layer.borderColor = nil
        }
        
        if let width = value(forKeyPath: "layer.borderWidth") as? CGFloat {
            layer.borderWidth = width
            
        }else {
            layer.borderWidth = 0
        }
//        layer.borderColor = (value(forKeyPath: "layer.borderColor") as? UIColor).cgColor
        
        layer.cornerRadius = 10
        layer.frame = CGRect(
            x: frame.origin.x - 10,
            y: frame.origin.y + 20,
            width: frame.size.width + 20,
            height: frame.size.height + 20)
        
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
