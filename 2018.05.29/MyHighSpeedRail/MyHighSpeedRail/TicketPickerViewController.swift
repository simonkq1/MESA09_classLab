//
//  TicketPickerViewController.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/6/9.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class TicketPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var universityLable: UILabel!
    let list = [[0,1,2,3,4,5,6,7,8,9,10],[0,1,2,3,4,5,6,7,8,9,10],[0,1,2,3,4,5,6,7,8,9,10],[0,1,2,3,4,5,6,7,8,9,10],[0,1,2,3,4,5,6,7,8,9,10]]
    
    var isNormal = true
    @IBOutlet weak var pickerView: UIPickerView!
    var allTicketNumber: Int = 1
    var helfTicketNumber: Int = 0
    @IBAction func okBtn(_ sender: Any) {
        let mainView = parent as! MainViewController
        
        
        let adult = ((mainView.table_vc.view.viewWithTag(700) as! UITableViewCell).viewWithTag(10) as! UILabel)
        let child = ((mainView.table_vc.view.viewWithTag(700) as! UITableViewCell).viewWithTag(20) as! UILabel)
        let old = ((mainView.table_vc.view.viewWithTag(700) as! UITableViewCell).viewWithTag(30) as! UILabel)
        let heart = ((mainView.table_vc.view.viewWithTag(700) as! UITableViewCell).viewWithTag(40) as! UILabel)
        let university = ((mainView.table_vc.view.viewWithTag(700) as! UITableViewCell).viewWithTag(50) as! UILabel)
        
        let pickerAdult = list[0][pickerView.selectedRow(inComponent: 0)]
        let pickerChild = list[1][pickerView.selectedRow(inComponent: 1)]
        let pickerOld = list[2][pickerView.selectedRow(inComponent: 2)]
        let pickerHeart = list[3][pickerView.selectedRow(inComponent: 3)]
        let pickerUniversity: Int = (isNormal == true) ? list[4][pickerView.selectedRow(inComponent: 4)] : 0
        let allTickets: Int = pickerAdult + pickerChild + pickerOld + pickerHeart + pickerUniversity
        allTicketNumber = allTickets
        helfTicketNumber = pickerChild + pickerOld + pickerHeart
        if checkTicketNumber(adult: pickerAdult, child: pickerChild, old: pickerOld, heart: pickerHeart, university: pickerUniversity) == false {
            MyAlert.buttonIsExist[0] = false
            
            DispatchQueue.main.async {
                MyAlert.myAlertTitle = "乘客人數輸入錯誤！"
                MyAlert.myAlertText = "每筆交易最多10張，去回1人次以2張計算，請重新選擇人數"
            }
            
            let alert = storyboard?.instantiateViewController(withIdentifier: "myalert")
            present(alert!, animated: false, completion: nil)
            
        }else {
            if allTickets == 0 {
                mainView.table_vc.isHidden[5] = true
                mainView.table_vc.tableView.beginUpdates()
                mainView.table_vc.tableView.endUpdates()
            }else {
                mainView.table_vc.isHidden[5] = false
                mainView.table_vc.tableView.beginUpdates()
                mainView.table_vc.tableView.endUpdates()
            }
            
            if allTickets > 1 {
                mainView.table_vc.isHidden[6] = true
                mainView.table_vc.tableView.beginUpdates()
                mainView.table_vc.tableView.endUpdates()
            }else {
                mainView.table_vc.isHidden[6] = false
                mainView.table_vc.tableView.beginUpdates()
                mainView.table_vc.tableView.endUpdates()
            }
            
            
            mainView.tableViewTopConstraint.constant = 0
            mainView.ticketNumberConstraint.constant = -330
            UIView.animate(withDuration: 0.5) {
                mainView.view.layoutIfNeeded()
            }
            
            Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { (timer) in
                mainView.tabBarController?.tabBar.isHidden = false
            }
            mainView.bgConstraint.constant = -667
            
            adult.text = "全票    \(pickerAdult)"
            child.text = "孩童    \(pickerChild)"
            old.text = "敬老    \(pickerOld)"
            heart.text = "愛心    \(pickerHeart)"
            university.text = "大學生 \(pickerUniversity)"
            
            
        }
        
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if isNormal == true {
            return list.count
        }
        return list.count - 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list[component].count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(list[component][row])
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pickerView.selectRow(1, inComponent: 0, animated: false)
    }
    
    func checkTicketNumber(adult: Int, child: Int, old: Int, heart: Int, university: Int = 0) -> Bool{
        let mainView = parent as! MainViewController
        let isTwoTicket = (mainView.table_vc.isTwoWay == false) ? 1 : 2
        if isNormal == true {
            if isTwoTicket * (adult + child + old + heart + university) > 10 {
                return false
            }
        }else {
            if  isTwoTicket * (adult + child + old + heart) > 10 {
                return false
            }
        }
        return true
        
    }
    
    func myAlert() {
        
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
