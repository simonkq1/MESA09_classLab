//
//  ViewController.swift
//  2018.05.23_1
//
//  Created by admin on 2018/5/23.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var BMI: UILabel!
    @IBAction func onClick(_ sender: Any) {
//        height.endEditing(true)
//        weight.endEditing(true)
        let h = Float(height.text!)
        let w = Float(weight.text!)
        if height.text != "" && weight.text != "" {
            
            if let h = h, let w = w {
                let ans = h / pow(w/100, 2)
                BMI.text = String(ans)
            }else{
                BMI.text = "請輸入正確的格式"
            }
        }else{
            BMI.text = "請輸入身高體重"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

