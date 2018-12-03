//
//  ViewController.swift
//  2018.05.30_app1
//
//  Created by admin on 2018/5/30.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var lastConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundConstrant: NSLayoutConstraint!
    @IBOutlet weak var leadingConstrant: NSLayoutConstraint!
    var origionalX: CGFloat? = nil
    @IBAction func edgePanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        let location = sender.location(in: view)
//        leadingConstrant.constant = 0
//        UIView.animate(withDuration: 0.5) {
//            self.view.layoutIfNeeded()
//        }
//        if origionalX == nil {
//            origionalX = location.x
//        }
//        if leadingConstrant.constant < 0 {
//            leadingConstrant.constant = -240 + location.x - origionalX!
//            print(location)
//        }
        
        switch sender.state {
        case .began:
            
            origionalX = location.x
        case .ended:
            if leadingConstrant.constant > 0 {
                leadingConstrant.constant = 0
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
            }else if leadingConstrant.constant > -130 || leadingConstrant.constant == -130{
                leadingConstrant.constant = 0
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
            }else if leadingConstrant.constant < -130 {
                
                leadingConstrant.constant = -260
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
            }
            
            if backgroundConstrant.constant > -140 {
                backgroundConstrant.constant = -140
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
            }else if backgroundConstrant.constant > -270 || backgroundConstrant.constant == -270{
                backgroundConstrant.constant = -140
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
            }else if backgroundConstrant.constant < -270 {
                
                backgroundConstrant.constant = -400
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
            }
        case .changed:
            if leadingConstrant.constant < 0 {
                leadingConstrant.constant = -240 + location.x - origionalX!
            }
            if backgroundConstrant.constant < 0 {
                backgroundConstrant.constant = -380 + location.x - origionalX!
            }
            
        default:
            break
        }
        
    }
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        leadingConstrant.constant = -260
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
        
    
    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        leadingConstrant.constant = -260
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        backgroundConstrant.constant = -400
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        
    }
    
    
    //    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
//        let location = sender.location(in: view)
//        sender.view?.center = location
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

