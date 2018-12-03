//
//  PayAndGetViewController.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/6/14.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class PayAndGetViewController: UIViewController {

    @IBOutlet weak var btnLayout: NSLayoutConstraint!
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBAction func tapGesture(_ sender: Any) {
        if btnLayout.constant == 4 {
            btnLayout.constant = rightLabel.frame.size.width - 3
            UINavigationBar.animate(withDuration: 0.5) {
                self.viewButton.layoutIfNeeded()
            }
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
                self.leftLabel.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
                self.rightLabel.textColor = UIColor.white
            }
            
        }else {
            btnLayout.constant = 4
            UINavigationBar.animate(withDuration: 0.5) {
                self.viewButton.layoutIfNeeded()
            }
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
                self.rightLabel.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
                self.leftLabel.textColor = UIColor.white
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewButton.viewButtonStyle()
        moveLabel.moveLabelStyle()
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
