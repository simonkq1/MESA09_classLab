//
//  Global.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/6/10.
//  Copyright © 2018年 admin. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func viewButtonStyle() {
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1).cgColor
        self.layer.cornerRadius = 5
    }
    
    
    func addBorder( withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let shapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        
        linePath.move(to: CGPoint(x: 0, y: frame.maxY - 10))
        linePath.addLine(to: CGPoint(x: frame.size.width, y: frame.maxY - 10))
        
        shapeLayer.strokeColor = color
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = thickness
        
        shapeLayer.path = linePath.cgPath
        
        layer.addSublayer(shapeLayer)
    }
}

extension UILabel {
    func moveLabelStyle() {
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 255/255, green: 147/255, blue: 0/255, alpha: 1).cgColor
        layer.masksToBounds = true
        self.layer.cornerRadius = 4
    }
}
extension NSLayoutConstraint {
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
    NSLayoutConstraint.deactivate([self])
    let newConstraint = NSLayoutConstraint(
        item: firstItem as Any,
        attribute: firstAttribute,
        relatedBy: relation,
        toItem: secondItem,
        attribute: secondAttribute,
        multiplier: multiplier,
        constant: constant)
    
    newConstraint.priority = priority
    newConstraint.shouldBeArchived = self.shouldBeArchived
    newConstraint.identifier = self.identifier
    
    NSLayoutConstraint.activate([newConstraint])
    return newConstraint
    }
    
}
