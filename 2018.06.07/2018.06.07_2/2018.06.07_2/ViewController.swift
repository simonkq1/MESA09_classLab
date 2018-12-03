//
//  ViewController.swift
//  2018.06.07_2
//
//  Created by admin on 2018/6/7.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let pedometer = CMPedometer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if CMPedometer.isStepCountingAvailable() {
            pedometer.queryPedometerData(from: Date().addingTimeInterval(-24 * 60 * 60), to: Date()) { (pedometerData, error) in
                if error != nil {
                    print(error!)
                }else {
                    print("距離 \(pedometerData!.distance)") //距離
                    print("步數 \(pedometerData!.numberOfSteps)") //步數
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

