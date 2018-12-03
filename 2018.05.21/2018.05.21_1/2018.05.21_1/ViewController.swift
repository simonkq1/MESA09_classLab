//
//  ViewController.swift
//  2018.05.21_1
//
//  Created by admin on 2018/5/21.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    @IBAction func onTab(_ sender: Any) {
        let url=URL(string: "https://goo.gl/maps/G2AQJq3R37S2" )
        let vc=SFSafariViewController(url: url!)
        showDetailViewController(vc, sender: self)
//        show(vc, sender: self)
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

