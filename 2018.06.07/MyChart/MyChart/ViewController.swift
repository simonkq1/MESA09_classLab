//
//  ViewController.swift
//  2018.06.07_1
//
//  Created by admin on 2018/6/7.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var shapeLayer = CAShapeLayer()
    
    func shapeDraw() -> CAShapeLayer {
        
        let shapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        
        linePath.move(to: CGPoint(x: 10, y: 10))
        linePath.addLine(to: CGPoint(x: 300, y: 200))
        linePath.addLine(to: CGPoint(x: 100, y: 250))
        linePath.close()
        
        
        shapeLayer.name = "line"
//                shapeLayer.frame = CGRect(x: 10, y: 10, width: 290, height: 240)
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 20
        shapeLayer.lineDashPattern = [10, 3]      //[0] 為實線部分   [1]為空白部分
        shapeLayer.lineJoin = kCALineJoinBevel
        
        shapeLayer.path = linePath.cgPath
        
//        view.layer.addSublayer(shapeLayer)
        return shapeLayer
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       view.layer.addSublayer(shapeDraw())
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("aaa")
        let point = touches.first?.location(in: view)
        print(shapeDraw().path?.contains(point!))
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CircleViewController
        vc.currentValue = 18
    }
    

}

