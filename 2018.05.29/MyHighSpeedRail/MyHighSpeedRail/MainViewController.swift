//
//  MainViewController.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/5/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var buttonConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var dateConstraint: NSLayoutConstraint!
    @IBOutlet weak var returnDateConstraint: NSLayoutConstraint!
    @IBOutlet weak var ticketNumberConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var sitPickerConstrsint: NSLayoutConstraint!
    
    @IBOutlet weak var bgConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var tableView: UIView!
    
    var table_vc: TableViewController!
    var switch_vc: ViewController!
    var ticket_vc: TicketPickerViewController!
    var returndate_vc: ReturnDateViewController!
    var date_vc: DateViewController!
    var searchData: [String:Any] = [:]
   static var viewdidAction: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for v in childViewControllers {
            if v.restorationIdentifier == "table_vc" {
                table_vc = v as! TableViewController
            }else if v.restorationIdentifier == "switch_vc" {
                switch_vc = v as! ViewController
            }else if v.restorationIdentifier == "ticket_vc" {
                ticket_vc = v as! TicketPickerViewController
            }else if v.restorationIdentifier == "returndate_vc" {
                returndate_vc = v as! ReturnDateViewController
            }else if v.restorationIdentifier == "date_vc" {
                date_vc = v as! DateViewController
            }
        }
        
        
    }
    
    func showSearchList() {
        let pickerView = switch_vc.pickerView
        
        let startStation = switch_vc.list[0][(pickerView?.selectedRow(inComponent: 0))!]
        let endStation = switch_vc.list[1][(pickerView?.selectedRow(inComponent: 1))!]
        let goTime = date_vc.datePicker.date
        let returnTime = returndate_vc.selectData ?? Date()
        
        searchData = ["startStation":startStation,"endStation":endStation,"goTime":goTime,"returnTime": returnTime,"isTwoWay":table_vc.isTwoWay]
        SearchViewController.searchData = searchData
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        self.navigationController?.navigationItem.title = "訂票"
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_search_vc" {
            if (table_vc.view.viewWithTag(600) as! UITableViewCell).detailTextLabel?.text == "     請選擇回程時間", table_vc.isTwoWay == true {
                MyAlert.myAlertTitle = ""
                MyAlert.myAlertText = "去程或回程日期未選擇，請重新輸入"
                MyAlert.buttonIsExist[0] = false
                let alert = storyboard?.instantiateViewController(withIdentifier: "myalert")
                present(alert!, animated: false, completion: nil)
            }else if ticket_vc.allTicketNumber == 0 {
                MyAlert.myAlertTitle = "乘客人數輸入錯誤！"
                MyAlert.myAlertText = "每筆交易需至少訂購一張車票。"
                MyAlert.buttonIsExist[0] = false
                let alert = storyboard?.instantiateViewController(withIdentifier: "myalert")
                present(alert!, animated: false, completion: nil)
            }else if table_vc.isTwoWay == true, DateViewController.selectDate > ReturnDateViewController.selectDate {
                print("AAAA")
                MyAlert.myAlertTitle = "日期/時間錯誤！"
                MyAlert.myAlertText = "回程出發時間應晚於去程到達時間，請重新選擇。"
                MyAlert.buttonIsExist[0] = false
                let alert = storyboard?.instantiateViewController(withIdentifier: "myalert")
                present(alert!, animated: false, completion: nil)
            }else {
                showSearchList()
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
