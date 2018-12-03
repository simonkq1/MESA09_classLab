//
//  Global.swift
//  2018.06.06_1
//
//  Created by admin on 2018/6/6.
//  Copyright © 2018年 admin. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func setBorderColor(_ color: CGColor, _ width: CGFloat = 1){
        layer.borderWidth = 1
        layer.borderColor = color
        layer.frame = CGRect(
            x: frame.origin.x - 10,
            y: frame.origin.y - 10,
            width: frame.size.width + 20,
            height: frame.size.height + 10)
        layer.cornerRadius = 35
        layer.backgroundColor = UIColor.green.cgColor
        
        
    }
    func rotate(angle: CGFloat) {
        
        layer.setAffineTransform(CGAffineTransform(rotationAngle: angle / 180 * CGFloat.pi))
        
//        return CGAffineTransform(rotationAngle: 45 / 180 * CGFloat.pi)
    }
}
