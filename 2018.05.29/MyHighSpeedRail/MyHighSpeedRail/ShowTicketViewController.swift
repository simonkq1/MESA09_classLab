//
//  ShowTicketViewController.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/6/14.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ShowTicketViewController: UIViewController {

    @IBAction func orderTicket(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func getTicket(_ sender: Any) {
        tabBarController?.selectedIndex = 2
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
