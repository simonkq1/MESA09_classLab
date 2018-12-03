//
//  ViewController.swift
//  MyCharts
//
//  Created by admin on 2018/6/15.
//  Copyright © 2018年 Simon Chang. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var chartView: UIView!
    var myView: UIView!
    var positionData: [[String:Any]] = []
    var xPosition: [CGFloat] = []
    var yPosition: [CGFloat] = []
    var viewHeight:CGFloat!
    var chartHeight: [CGFloat] = []
    let shapeLayer = CAShapeLayer()
    let lineLayer = CAShapeLayer()
    let circleLayer = CAShapeLayer()
    let middleLayer = CAShapeLayer()
    let chartBackgroundLayerX = CAShapeLayer()
    let chartBackgroundLayerY = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DDD")
        myView = UIView()
        myView.frame = chartView.frame
        chartView.addSubview(myView)
        // Do any additional setup after loading the chartView.
        //        chartView.layer.addSublayer(chartDraw(position: 0, width: 20, height: 50))
        if chartView.frame.size.width > chartView.frame.size.height {
            viewHeight = chartView.frame.size.width
        }else {
            viewHeight = chartView.frame.size.height
        }
        var i = 0
        Timer.scheduledTimer(withTimeInterval: 2 / 1000, repeats: true) { (timer) in
            if i <= 1000 {
                self.mylabel.text = "\(i)"
                i += 1
            }else {
                timer.invalidate()
            }
        }
        
        chartDraw(barNumber: 8,space: 20, width: 30, height: 500,100,200,20,50,70,100,400, color: .red)
    }
    
    func textDrawX() -> CATextLayer {
        let textLayerX = CATextLayer()
        textLayerX.frame.size.height = 50
        textLayerX.frame.size.width = 100
        textLayerX.frame.origin = CGPoint(x: xPosition[xPosition.count - 1] + 50, y: viewHeight - 17)
        textLayerX.foregroundColor = UIColor.black.cgColor
        textLayerX.fontSize = 20
        textLayerX.string = "X"
        
        return textLayerX
    }
    
    func textDrawy() -> CATextLayer {
        let textLayerY = CATextLayer()
        
        let max = positionData.sorted { (d1, d2) -> Bool in
            return d1["height"] as! CGFloat > d2["height"] as! CGFloat
        }
        
        textLayerY.frame.size.height = 50
        textLayerY.frame.size.width = 100
        textLayerY.frame.origin = CGPoint(x: 5, y: viewHeight - (max[0]["height"] as! CGFloat) - 80)
        textLayerY.foregroundColor = UIColor.black.cgColor
        textLayerY.fontSize = 20
        textLayerY.string = "Y"
        
        return textLayerY
    }
    
    func pointTextDraw(x: CGFloat, y:CGFloat, string: String) -> CATextLayer {
        let pointText = CATextLayer()
        pointText.frame.size.height = 30
        pointText.frame.size.width = 60
        pointText.frame.origin = CGPoint(x: x, y: y)
        pointText.foregroundColor = UIColor.black.cgColor
        pointText.fontSize = 15
        pointText.string = string
        
        return pointText
    }
    
    func XpointTextDraw(x: CGFloat, y:CGFloat, string: String) -> CATextLayer {
        let pointText = CATextLayer()
        pointText.frame.size.height = 30
        pointText.frame.size.width = 60
        pointText.frame.origin = CGPoint(x: x, y: y)
        pointText.foregroundColor = UIColor.black.cgColor
        pointText.fontSize = 15
        pointText.string = string
        
        return pointText
    }
    
    func barDraw(position:CGFloat,space: CGFloat, width x:CGFloat, height y: CGFloat, color: UIColor = UIColor.black) -> CAShapeLayer {
        
        
        //        viewHeight = chartView.frame.size.height
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
    func chartBackgroundDrawX() ->CAShapeLayer {
        let linePath = UIBezierPath()
        let maxX = xPosition.sorted(by: >)
        
        linePath.move(to: CGPoint(x: 5, y: viewHeight))
        linePath.addLine(to: CGPoint(x: xPosition[xPosition.count - 1] + 50, y: viewHeight))
        
        chartBackgroundLayerX.strokeColor = UIColor.black.cgColor
        chartBackgroundLayerX.fillColor = UIColor.clear.cgColor
        chartBackgroundLayerX.lineWidth = 4
        chartBackgroundLayerX.path = linePath.cgPath
        
        return chartBackgroundLayerX
        
    }
    func chartBackgroundDrawY() ->CAShapeLayer {
        let linePath = UIBezierPath()
        let max = positionData.sorted { (d1, d2) -> Bool in
            return d1["height"] as! CGFloat > d2["height"] as! CGFloat
        }
        
        linePath.move(to: CGPoint(x: 5, y: viewHeight))
        linePath.addLine(to: CGPoint(x: 5, y: viewHeight - (max[0]["height"] as! CGFloat) - 50))
        
        chartBackgroundLayerY.strokeColor = UIColor.black.cgColor
        chartBackgroundLayerY.fillColor = UIColor.clear.cgColor
        chartBackgroundLayerY.lineWidth = 4
        chartBackgroundLayerY.path = linePath.cgPath
        
        return chartBackgroundLayerY
        
    }
    func lineChartDraw(color: UIColor = UIColor.black) -> CAShapeLayer {
        let linePath = UIBezierPath()
        
        //        let start = space + (position * x)
        
        var i = 1
        linePath.move(to: CGPoint(x: xPosition[0], y: yPosition[0] + ((positionData[0]["height"] as! CGFloat) / 2)))
        while i < xPosition.count {
            linePath.addLine(to: CGPoint(x: xPosition[i], y: yPosition[i] + ((positionData[i]["height"] as! CGFloat) / 2) ))
            i += 1
        }
        
        
        print("x : \(xPosition), y: \(yPosition)")
        
        
        lineLayer.strokeColor = color.cgColor
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.lineJoin = kCALineJoinRound
        lineLayer.lineWidth = 4
        lineLayer.path = linePath.cgPath
        
        return lineLayer
        
    }
    
    func circleDraw() -> CAShapeLayer {
        var i = 0
        let circle = UIBezierPath()
        
        while i < xPosition.count {
            circle.move(to: CGPoint(x: xPosition[i], y: yPosition[i] + ((positionData[i]["height"] as! CGFloat) / 2) ))
            circle.addArc(
                withCenter: CGPoint(x: xPosition[i], y: yPosition[i] + ((positionData[i]["height"] as! CGFloat) / 2) ),
                radius: 3,
                startAngle: 0,
                endAngle: 360,
                clockwise: true)
            i += 1
        }
        circleLayer.strokeColor = UIColor.blue.cgColor
        circleLayer.fillColor = UIColor.blue.cgColor
        circleLayer.lineWidth = 5
        circleLayer.path = circle.cgPath
        return circleLayer
    }
    
    func middleLineDraw() -> CAShapeLayer {
        let linePath = UIBezierPath()
        var averageY: CGFloat = 0
        for i in yPosition {
            averageY += i
        }
       averageY = averageY / CGFloat(xPosition.count)
        linePath.move(to: CGPoint(x: 0, y: (averageY)))
        linePath.addLine(to: CGPoint(x: xPosition[xPosition.count - 1] + (positionData[0]["width"] as! CGFloat), y: (averageY)))
        
        middleLayer.strokeColor = UIColor.black.cgColor
        middleLayer.fillColor = UIColor.clear.cgColor
        middleLayer.lineDashPattern = [10, 5]
        
        middleLayer.path = linePath.cgPath
        return middleLayer
        
    }
    
    
    func chartDraw(barNumber n: Int,space: CGFloat, width: CGFloat, height: CGFloat..., color: UIColor = UIColor.black) {
        for i in 0..<n {
            if i < height.count {
                //                chartView.layer.addSublayer(barDraw(position: CGFloat(i),space: space, width: width, height: height[i], color: color))
                let current = barDraw(position: CGFloat(i),space: space, width: width, height: height[i], color: color)
                current.add(strokeEndAnimation(duraction: 1), forKey: nil)
                positionData.append(["position":CGFloat(i), "space":space,"width":width,"height":height[i],"color":color])
                
                myView.layer.addSublayer(current)
                let pointString = "\(height[i])"
                let textCurrent = pointTextDraw(x: (height[i] != 20.0) ? xPosition[i] - width / 2 : xPosition[i] - width / 3, y: (height[i] != 20.0) ? yPosition[i] - 20 : yPosition[i] - 25, string: pointString)
                myView.layer.addSublayer(textCurrent)
                
                let xPoint: String = "\(xPosition[i])"
                let textCurrentX = pointTextDraw(x: xPosition[i] - width / 2, y: viewHeight, string: xPoint)
                myView.layer.addSublayer(textCurrentX)
                
            }
            
        }
        let lineCurrent = lineChartDraw(color: .blue)
        lineCurrent.add(strokeEndAnimation(duraction: 1), forKey: nil)
        let circleCurrent = circleDraw()
        circleCurrent.add(strokeEndAnimation(duraction: 1), forKey: nil)
        let averageCurrent = middleLineDraw()
        averageCurrent.add(strokeEndAnimation(duraction: 1), forKey: nil)
        myView.layer.addSublayer(lineCurrent)
        myView.layer.addSublayer(circleCurrent)
        myView.layer.addSublayer(averageCurrent)
        myView.layer.addSublayer(chartBackgroundDrawX())
        myView.layer.addSublayer(chartBackgroundDrawY())
        myView.layer.addSublayer(textDrawX())
        myView.layer.addSublayer(textDrawy())
        
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
        print("CCC")
        //        print(positionData)
        //        print(positionData.count)
        //        print(xPosition)
        //        print(yPosition)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("Aaa")
        
        chartView.reloadInputViews()
//        let lineCurrent = lineChartDraw(color: .blue)
//        lineCurrent.add(strokeEndAnimation(duraction: 1), forKey: nil)
//        chartView.layer.addSublayer(lineCurrent)
        
//        chartDraw(barNumber: 8,space: 20, width: 30, height: 500,100,200,20,50,70,100,400, color: .red)
        
        //        chartDraw(barNumber: 5,space: 20, width: 30, height: 50,100,200,20,50, color: .red)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print("BBB")
//        if chartView.frame.size.width > chartView.frame.size.height {
//            viewHeight = chartView.frame.size.width
//        }else {
//            viewHeight = chartView.frame.size.height
//        }
//        myView.removeFromSuperview()
//        myView = UIView()
//        myView.frame = chartView.frame
//        chartView.addSubview(myView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new chartView controller using segue.destinationViewController.
     // Pass the selected object to the new chartView controller.
     }
     */
}

