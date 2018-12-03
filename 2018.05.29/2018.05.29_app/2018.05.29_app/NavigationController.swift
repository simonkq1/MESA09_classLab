//
//  NavigationController.swift
//  2018.05.29_app
//
//  Created by admin on 2018/5/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SystemConfiguration      //網路連線狀態
class NavigationController: UINavigationController, UINavigationControllerDelegate {
    
    let reach = SCNetworkReachabilityCreateWithName(nil, "localhost")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        delegate = self
        
        
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
                if let bn = self.topViewController?.navigationItem.rightBarButtonItem{
                    self.checkNetwork(bn)
                }
                
            }
        
        
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        var bn = viewController.navigationItem.rightBarButtonItem
        if bn == nil{
            bn = UIBarButtonItem()
            viewController.navigationItem.rightBarButtonItem = bn
        }
            checkNetwork(bn!)
        
    }
    
    
    func checkNetwork(_ bn: UIBarButtonItem){
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reach!, &flags)   //&flags。傳址呼叫
        DispatchQueue.main.async {
            if flags.contains(.reachable){
                bn.image = UIImage(named: "online")?.withRenderingMode(.alwaysOriginal)
            }else{
                bn.image = UIImage(named: "offline")?.withRenderingMode(.alwaysOriginal)
            }
        }
        
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
