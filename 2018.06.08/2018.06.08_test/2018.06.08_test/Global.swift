//
//  Global.swift
//  2018.06.08_test
//
//  Created by admin on 2018/6/8.
//  Copyright © 2018年 admin. All rights reserved.
//

import Foundation
import UIKit

extension UIBezierPath {
    
    func getOneControlPoint (
        x0: CGFloat, y0: CGFloat,
        x1: CGFloat, y1: CGFloat,
        x2: CGFloat, y2: CGFloat
        ) {
        
        let smooth_value: CGFloat = 0.6
        var ctrl1_x: CGFloat!
        var ctrl1_y: CGFloat!
//        var ctrl2_x: CGFloat!
//        var ctrl2_y: CGFloat!
        
        let xc1: CGFloat = (x0 + x1) / 2.0
        let yc1: CGFloat = (y0 + y1) / 2.0
        let xc2: CGFloat = (x1 + x2) / 2.0
        let yc2: CGFloat = (y1 + y2) / 2.0
//        let xc3: CGFloat = (x2 + x3) / 2.0
//        let yc3: CGFloat = (y2 + y3) / 2.0
        
        let len1 = CGFloat( sqrt(Double((x1 - x0) * (x1 - x0) + (y1 - y0) * (y1 - y0))))
        let len2 = CGFloat( sqrt(Double((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))))
//        let len3 = CGFloat( sqrt(Double((x3 - x2) * (x3 - x2) + (y3 - y2) * (y3 - y2))))
        
        let k1: CGFloat = len1 / (len1 + len2)
//        let k2: CGFloat = len2 / (len2 + len3)
        
        let xm1: CGFloat = xc1 + (xc2 - xc1) * k1
        let ym1: CGFloat = yc1 + (yc2 - yc1) * k1
//        let xm2: CGFloat = xc2 + (xc3 - xc2) * k2
//        let ym2: CGFloat = yc2 + (yc3 - yc2) * k2
        
        
        ctrl1_x = xm1 + (xc2 - xm1) * smooth_value + x1 - xm1
        ctrl1_y = ym1 + (yc2 - ym1) * smooth_value + y1 - ym1
//        ctrl2_x = xm2 + (xc2 - xm2) * smooth_value + x2 - xm2
//        ctrl2_y = ym2 + (yc2 - ym2) * smooth_value + y2 - ym2
        addQuadCurve(to: CGPoint(x: x2, y: y2), controlPoint: CGPoint(x: ctrl1_x, y: ctrl1_y))
        
    }
    
    func getTwoControlPoint (
        x0: CGFloat, y0: CGFloat,
        x1: CGFloat, y1: CGFloat,
        x2: CGFloat, y2: CGFloat,
        x3: CGFloat, y3: CGFloat
        ) {
        
        let smooth_value: CGFloat = 0.6
        var ctrl1_x: CGFloat!
        var ctrl1_y: CGFloat!
        var ctrl2_x: CGFloat!
        var ctrl2_y: CGFloat!
        
        let xc1: CGFloat = (x0 + x1) / 2.0
        let yc1: CGFloat = (y0 + y1) / 2.0
        let xc2: CGFloat = (x1 + x2) / 2.0
        let yc2: CGFloat = (y1 + y2) / 2.0
        let xc3: CGFloat = (x2 + x3) / 2.0
        let yc3: CGFloat = (y2 + y3) / 2.0
        
        let len1 = CGFloat( sqrt(Double((x1 - x0) * (x1 - x0) + (y1 - y0) * (y1 - y0))))
        let len2 = CGFloat( sqrt(Double((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))))
        let len3 = CGFloat( sqrt(Double((x3 - x2) * (x3 - x2) + (y3 - y2) * (y3 - y2))))
        
        let k1: CGFloat = len1 / (len1 + len2)
        let k2: CGFloat = len2 / (len2 + len3)
        
        let xm1: CGFloat = xc1 + (xc2 - xc1) * k1
        let ym1: CGFloat = yc1 + (yc2 - yc1) * k1
        let xm2: CGFloat = xc2 + (xc3 - xc2) * k2
        let ym2: CGFloat = yc2 + (yc3 - yc2) * k2
        
        
        ctrl1_x = xm1 + (xc2 - xm1) * smooth_value + x1 - xm1
        ctrl1_y = ym1 + (yc2 - ym1) * smooth_value + y1 - ym1
        ctrl2_x = xm2 + (xc2 - xm2) * smooth_value + x2 - xm2
        ctrl2_y = ym2 + (yc2 - ym2) * smooth_value + y2 - ym2
        
        
        addCurve(to: CGPoint(x: x2, y: y2), controlPoint1: CGPoint(x: ctrl1_x, y: ctrl1_y), controlPoint2: CGPoint(x: ctrl2_x, y: ctrl2_y))
        
    }
}
