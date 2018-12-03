//
//  ReturnDateViewController.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/6/9.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ReturnDateViewController: UIViewController {
    
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var selectData: Date!
    static var selectDate: Date!
    static var minimumDate: Date = Date()
    @IBAction func okBtn(_ sender: Any) {
        let mainView = parent as! MainViewController
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/MM/dd HH:mm"
        let string = dateFormatter.string(from: datePicker.date)
        (mainView.table_vc.view.viewWithTag(600) as! UITableViewCell).detailTextLabel?.text = "     \(string)"
        
        mainView.returnDateConstraint.constant = -330
        UIView.animate(withDuration: 0.5) {
            mainView.view.layoutIfNeeded()
        }
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { (timer) in
            mainView.tabBarController?.tabBar.isHidden = false
        }
        selectData = datePicker.date
        ReturnDateViewController.selectDate = datePicker.date
        mainView.table_vc.isNormal = false
        mainView.bgConstraint.constant = -667
        print(string)
        
    }
    @IBAction func setToday(_ sender: Any) {
        let mainView = parent as! MainViewController
        let dateToday = Calendar.current.startOfDay(for: Date())
        let dateTarget = Calendar.current.startOfDay(for: mainView.date_vc.datePicker.date)
        
        
            datePicker.setDate(mainView.date_vc.datePicker.date, animated: true)
    }
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/MM/dd HH:mm"
        let string = dateFormatter.string(from: sender.date)
        datePicker.minimumDate = Date()
        //        if datePicker.date < Date() {
        //            datePicker.date = Date()
        //        }
        print(string)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        datePicker.backgroundColor = UIColor.white
        datePicker.minimumDate = ReturnDateViewController.minimumDate
    }
    override func viewDidAppear(_ animated: Bool) {
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
