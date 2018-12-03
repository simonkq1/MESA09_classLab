//
//  ViewController.swift
//  2018.06.08_test
//
//  Created by admin on 2018/6/8.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.layer.addSublayer(shapeDraw())
    }
    
    
    func shapeDraw() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let viewHeight = view.frame.size.height
        var linePath = UIBezierPath()
        
//        linePath.move(to: CGPoint(x: 20, y: viewHeight - 20))
        linePath.move(to: CGPoint(x: 0, y: viewHeight))
//        linePath.getOneControlPoint(x0: 20, y0: viewHeight - 20, x1: 80, y1: viewHeight - 120, x2: 150, y2: viewHeight - 200, x3: 200, y3: viewHeight - 50)
        
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        shapeLayer.path = linePath.cgPath
        
        return shapeLayer
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

