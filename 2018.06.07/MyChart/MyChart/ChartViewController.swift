//
//  SecondViewController.swift
//  2018.06.07_1
//
//  Created by admin on 2018/6/7.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit




class ChartViewController: UIViewController {
    
    
    var positionData: [[String:Any]] = []
    var xPosition: [CGFloat] = []
    var yPosition: [CGFloat] = []
    var viewHeight:CGFloat!

    let shapeLayer = CAShapeLayer()
    let lineLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        view.layer.addSublayer(chartDraw(position: 0, width: 20, height: 50))
        if view.frame.size.width > view.frame.size.height {
            viewHeight = view.frame.size.width
        }else {
            viewHeight = view.frame.size.height
        }
        
    }
    
    
    func barDraw(position:CGFloat,space: CGFloat, width x:CGFloat, height y: CGFloat, color: UIColor = UIColor.black) -> CAShapeLayer {
        
        
//        viewHeight = view.frame.size.height
        let shapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()

//        let shapeLayer = CAShapeLayer()
        linePath.move(to: CGPoint(x: space + ((x + space) * position), y: viewHeight))
        linePath.addLine(to: CGPoint(x: space + ((x + space) * position), y: viewHeight - y))
//        linePath.addLine(to: CGPoint(x: x + (space + ((x + space) * position)), y: viewHeight - y))
//        linePath.addLine(to: CGPoint(x: x + (space + ((x + space) * position)), y: viewHeight))
        
        xPosition.append(space + ((x + space) * position))
        yPosition.append(viewHeight - y)
        
        
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.fillColor = color.cgColor
        shapeLayer.lineWidth = x
        shapeLayer.path = linePath.cgPath
        
        return shapeLayer
        
    }
    func lineChartDraw(color: UIColor = UIColor.black) -> CAShapeLayer {
        let linePath = UIBezierPath()
        
        
//        let start = space + (position * x)
        
        var i = 1
        linePath.move(to: CGPoint(x: xPosition[0], y: yPosition[0]))
//        linePath.move(to: CGPoint(
//            x: xPosition[1] + ((xPosition[1 + 1] - xPosition[1]) / 2),
//            y: yPosition[1] + ((yPosition[1 + 1] - yPosition[1]) / 2)))
        while i < xPosition.count {


//            linePath.addCurve(to: CGPoint(x: xPosition[i], y: yPosition[i]), controlPoint1: CGPoint(x: 40, y: viewHeight - 150), controlPoint2: CGPoint(x: 80, y: viewHeight + 50))
            if i + 1 < xPosition.count {

                linePath.addQuadCurve(
                    to: CGPoint(
                        x: xPosition[i] + ((xPosition[i + 1] - xPosition[i]) / 2),
                        y: yPosition[i] + ((yPosition[i + 1] - yPosition[i]) / 2)),
                    controlPoint: CGPoint(x: xPosition[i], y: yPosition[i]))
            }else {
                linePath.addLine(to: CGPoint(x: xPosition[xPosition.count - 1], y: yPosition[yPosition.count - 1]))
            }

//            linePath.addLine(to: CGPoint(x: xPosition[i], y: yPosition[i]))
            i += 1
        }
        
        
//        linePath.addQuadCurve(
//            to: CGPoint(
//                x: xPosition[1] + ((xPosition[1 + 1] - xPosition[1]) / 2),
//                y: yPosition[1] + ((yPosition[1 + 1] - yPosition[1]) / 2)),
//            controlPoint: CGPoint(x: xPosition[1], y: yPosition[1]))
//        linePath.addQuadCurve(
//            to: CGPoint(
//                x: xPosition[2] + ((xPosition[2 + 1] - xPosition[2]) / 2),
//                y: yPosition[2] + ((yPosition[2 + 1] - yPosition[2]) / 2)),
//            controlPoint: CGPoint(x: xPosition[2], y: yPosition[2] - 65))
        
        print("x : \(xPosition), y: \(yPosition)")
        
        
        lineLayer.strokeColor = color.cgColor
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.lineJoin = kCALineJoinRound
        lineLayer.lineWidth = 4
        lineLayer.path = linePath.cgPath
        
        return lineLayer
        
    }
    
    
    func chartDraw(barNumber n: Int,space: CGFloat, width: CGFloat, height: CGFloat..., color: UIColor = UIColor.black) {
        for i in 0..<n {
            if i < height.count {
//                view.layer.addSublayer(barDraw(position: CGFloat(i),space: space, width: width, height: height[i], color: color))
                let current = barDraw(position: CGFloat(i),space: space, width: width, height: height[i], color: color)
                current.add(strokeEndAnimation(duraction: 1), forKey: nil)
                
                positionData.append(["position":CGFloat(i), "space":space,"width":width,"height":height[i],"color":color])
                
                view.layer.addSublayer(current)
                
            }
            
        }
        let lineCurrent = lineChartDraw(color: .blue)
        lineCurrent.add(strokeEndAnimation(duraction: 5), forKey: nil)
        view.layer.addSublayer(lineCurrent)
    }
    
    
    func strokeEndAnimation(duraction: CFTimeInterval) -> CAKeyframeAnimation {
        
        let ani = CAKeyframeAnimation(keyPath: "strokeEnd")
        
        ani.duration = duraction
        ani.values = [0, 1]
        ani.timingFunctions = [CAMediaTimingFunction(controlPoints: 0.81, 0.40, 0.21, 0.95)]
        
        ani.isRemovedOnCompletion = false
        ani.fillMode = kCAFillModeForwards
        ani.repeatCount = 0
        
        return ani
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       chartDraw(barNumber: 5,space: 20, width: 30, height: 50,100,200,20,50, color: .red)
//        print(positionData)
//        print(positionData.count)
//        print(xPosition)
//        print(yPosition)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("Aaa")
        
        viewHeight = size.height
//        reloadInputViews()
        let lineCurrent = lineChartDraw(color: .blue)
        lineCurrent.add(strokeEndAnimation(duraction: 1), forKey: nil)
        view.layer.addSublayer(lineCurrent)
        
//        chartDraw(barNumber: 5,space: 20, width: 30, height: 50,100,200,20,50, color: .red)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {

        shapeLayer.removeFromSuperlayer()
        lineLayer.removeFromSuperlayer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
