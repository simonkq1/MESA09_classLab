//
//  CircalViewController.swift
//  2018.06.07_1
//
//  Created by admin on 2018/6/7.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class CircleViewController: UIViewController {
    var currentValue: CGFloat = 0
    
    @IBOutlet weak var label: UILabel!
    
    
    func drawCircle(_ color: CGColor) -> CAShapeLayer {
        
        var raduis: CGFloat = 0
        if view.frame.size.width > view.frame.size.height {
            raduis = view.frame.size.height / 2 - 20
        }else {
            raduis = view.frame.size.width / 2 - 20
        }
        
        let shapeLayer = CAShapeLayer()
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: view.center.x, y: view.center.y),
            radius: raduis,
//            startAngle: ((0 / 35) * 360 + 120) * CGFloat.pi / 180,
//            endAngle:  ((30 / 35) * 360 + 120) * CGFloat.pi / 180,
//            startAngle: 120 * CGFloat.pi / 180,
//            endAngle:  420 * CGFloat.pi / 180,
            startAngle: 0,
            endAngle: 120 * CGFloat.pi / 180,
            clockwise: true)
        
        shapeLayer.strokeColor = color
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.path = circlePath.cgPath
        
        
        
        
        return shapeLayer
    }
    
    func strokeEndAnimation(to: CGFloat) -> CAKeyframeAnimation {
        
        
        /*
        let ani = CABasicAnimation(keyPath: "strokeEnd")
        ani.duration = 2
        ani.fromValue = 0
        ani.toValue = to / 35.0
        ani.isRemovedOnCompletion = false
        ani.fillMode = kCAFillModeForwards
        ani.repeatCount = 0
 */
        let ani = CAKeyframeAnimation(keyPath: "strokeEnd")
        
        ani.duration = 3
        ani.values = [0, to / 35.0]
        ani.timingFunctions = [CAMediaTimingFunction(controlPoints: 0.81, 0.40, 0.21, 0.95)]
        
        ani.isRemovedOnCompletion = false
        ani.fillMode = kCAFillModeForwards
        ani.repeatCount = 0
        
        return ani
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        textAnimation()
        label.text = "\(Int(currentValue)) / 35"
        // =================
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let bgColor = UIColor(red: 119 / 255, green: 103 / 255, blue: 69 / 255, alpha: 1)
        //        let bgColor = UIColor.white
        
        
        view.layer.addSublayer(drawCircle(bgColor.cgColor))
        //       let bgLayer = drawCircle(bgColor2.cgColor)
        let currentColor = UIColor.white
        let currentLayer = drawCircle(currentColor.cgColor)
        currentLayer.add(strokeEndAnimation(to: currentValue), forKey: nil)
        view.layer.addSublayer(currentLayer)
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
