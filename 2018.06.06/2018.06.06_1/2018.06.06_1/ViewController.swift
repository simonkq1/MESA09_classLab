//
//  ViewController.swift
//  2018.06.06_1
//
//  Created by admin on 2018/6/6.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var buttonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true   //最上方橫列讀取中圖示
        
        button.setBorderColor(UIColor.red.cgColor)
        button.rotate(angle: 300)
        label.text = "dhjqceewewc"
        
        let maskLayer = CALayer()
        maskLayer.frame = imageView.bounds
        maskLayer.contents = UIImage(named: "heart")?.cgImage
        maskLayer.contentsScale = UIScreen.main.scale
        imageView.layer.mask = maskLayer
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

