//
//  ViewController.swift
//  2018.06.20_1
//
//  Created by admin on 2018/6/20.
//  Copyright © 2018年 Simon Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ledURL = "http://192.168.2.2/cgi-bin/led.cgi?pin=12&ison="
    
    @IBAction func onChanged(_ sender: UISwitch) {
        var url: URL? = nil
        if sender.isOn {
            url = URL(string: ledURL + "1")
        }else {
            url = URL(string: ledURL + "0")
        }
        let _ = try! String(contentsOf: url!)
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

