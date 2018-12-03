//
//  MyAlert.swift
//  2018.05.28_myalert
//
//  Created by admin on 2018/5/28.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class MyAlert: UIViewController {
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var text: UITextField!
    
    @IBAction func onDismiss(_ sender: Any) {
        
        okBtn.backgroundColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.5)
        
        toggleControlEnablr(true)
        let vc = self.presentingViewController as! ViewController
        if text.text != nil{
//            text.text as! String
            vc.callMeWhenReady(text.text!)
        }
        dismiss(animated: true, completion: nil)
        
        
        
    }
    private func toggleControlEnablr(_ flag: Bool){
        for v in (presentingViewController?.view.subviews)! {   //p.211 第三段
            if v is UIControl {
                if v is UIButton, v.tag == 200 {
                    continue
                }
                (v as! UIControl).isEnabled = flag
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.layer.cornerRadius = 20
        toggleControlEnablr(false)
//        text.border
        
        
//        okBtn.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
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
