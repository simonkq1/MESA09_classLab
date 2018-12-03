//
//  DateViewController.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/5/30.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    
//    let nowDate: Date! = nil

    @IBOutlet weak var datePicker: UIDatePicker!
    static var selectDate: Date = Date()
    var selectData: Date!
    @IBAction func okBtn(_ sender: Any) {
        let mainView = parent as! MainViewController
        let datePicker = view.viewWithTag(100) as! UIDatePicker
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/MM/dd HH:mm"
        let string = dateFormatter.string(from: datePicker.date)
        (mainView.table_vc.view.viewWithTag(500) as! UITableViewCell).detailTextLabel?.text = "     \(string)"
        
        mainView.dateConstraint.constant = -330
        UIView.animate(withDuration: 0.5) {
            mainView.view.layoutIfNeeded()
        }
        mainView.bgConstraint.constant = -667
        
        
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "DDD"
        
        
        let dateToday = Calendar.current.startOfDay(for: Date())
        let dateTarget = Calendar.current.startOfDay(for: datePicker.date)
        
        let components = Calendar.current.dateComponents([.day], from: dateToday, to: dateTarget).day ?? 0
        
        mainView.returndate_vc.datePicker.minimumDate = datePicker.date
        
        if components >= 4 {
            mainView.table_vc.isFourDays = true
            mainView.table_vc.tableView.beginUpdates()
            mainView.table_vc.tableView.endUpdates()
        }else {
            mainView.table_vc.isFourDays = false
            mainView.table_vc.tableView.beginUpdates()
            mainView.table_vc.tableView.endUpdates()
        }
        
        
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { (timer) in
            mainView.tabBarController?.tabBar.isHidden = false
        }
        DateViewController.selectDate = datePicker.date
        selectData = datePicker.date
        
    }
    @IBAction func setToday(_ sender: Any) {
        datePicker.date = Date()
    }
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/MM/dd HH:mm"
        let string = dateFormatter.string(from: sender.date)
        datePicker.minimumDate = Date()
        
        print(string)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.backgroundColor = UIColor.white
//        let mainView = parent as! MainViewController
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "YYYY/MM/dd H:mm"
//        let string = dateFormatter.string(from: Date())
//        (mainView.table_vc.view.viewWithTag(500) as! UITableViewCell).detailTextLabel?.text = "    \(string)"
        
        

        // Do any additional setup after loading the view.
        
        perform(#selector(didLoadShowTime), with: nil, afterDelay: 0.5)
    }
    
    @objc func didLoadShowTime() {
        let mainView = parent as! MainViewController
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/MM/dd HH:mm"
        let string = dateFormatter.string(from: Date())
        (mainView.table_vc.view.viewWithTag(500) as! UITableViewCell).detailTextLabel?.text = "     \(string)"
        
        
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
