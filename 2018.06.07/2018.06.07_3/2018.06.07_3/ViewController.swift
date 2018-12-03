//
//  ViewController.swift
//  2018.06.07_3
//
//  Created by admin on 2018/6/8.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.layer.addSublayer(layerDraw())
    }
    
    
    
    func layerDraw() -> CAShapeLayer{
        let shapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        let viewHeight = view.frame.size.height
        linePath.move(to: CGPoint(x: 20, y: viewHeight - 50))
        linePath.addQuadCurve(to: CGPoint(x: 40, y: viewHeight - 50), controlPoint: CGPoint(x: 30, y: viewHeight - 150))
        linePath.addQuadCurve(to: CGPoint(x: 60, y: viewHeight - 50), controlPoint: CGPoint(x: 50, y: viewHeight - -50))

//        linePath.addCurve(to: CGPoint(x: 100, y: viewHeight - 50), controlPoint1: CGPoint(x: 40, y: viewHeight - 150), controlPoint2: CGPoint(x: 80, y: viewHeight + 50))
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.lineJoin = kCALineJoinRound
        
        shapeLayer.path = linePath.cgPath
        return shapeLayer
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

