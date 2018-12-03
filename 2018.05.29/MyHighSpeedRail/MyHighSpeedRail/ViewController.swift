//
//  ViewController.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/5/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let list = [["南港","台北","板橋","桃園","新竹","苗栗","台中","彰化","雲林","嘉義","台南","左營"],
                ["南港","台北","板橋","桃園","新竹","苗栗","台中","彰化","雲林","嘉義","台南","左營"]
    ]
    
    @IBOutlet weak var pickerView: UIPickerView!
    var selectData: [String:String]!
    
    var tvc: TableViewController!
    
    @IBAction func okBtn(_ sender: Any) {
        
        
//        let pickerView = view.viewWithTag(100) as! UIPickerView
        let left = list[0][pickerView.selectedRow(inComponent: 0)]
        let right = list[1][pickerView.selectedRow(inComponent: 1)]
        let mvc = self.parent as! MainViewController
        
        if left == right {
            MyAlert.buttonIsExist[0] = false
            
            DispatchQueue.main.async {
                MyAlert.myAlertTitle = "起迄站輸入錯誤！"
                MyAlert.myAlertText = "您選擇之起/迄站相同，請重新輸入。"
            }
            let alert = storyboard?.instantiateViewController(withIdentifier: "myalert")
            present(alert!, animated: false, completion: nil)
        }else {
            mvc.buttonConstraint.constant = -330
            UIView.animate(withDuration: 0.5) {
                mvc.view.layoutIfNeeded()
            }
            mvc.bgConstraint.constant = -667
            
            print("起站為 : \(left) , 訖站為 : \(right)")
            
            
            
            (mvc.table_vc.view.viewWithTag(400) as! UITableViewCell).detailTextLabel?.text = "    \(left)   →   \(right)"
            Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { (timer) in
                mvc.tabBarController?.tabBar.isHidden = false
            }
            
            selectData = ["startStation":left,"endStation":right]
            
        }
        
    }
    
    @IBAction func exchangeBtn(_ sender: Any) {
        let pickerView = view.viewWithTag(100) as! UIPickerView
        let left = pickerView.selectedRow(inComponent: 0)
        let right = pickerView.selectedRow(inComponent: 1)
        pickerView.selectRow(right, inComponent: 0, animated: true)
        pickerView.selectRow(left, inComponent: 1, animated: true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        (view.viewWithTag(100) as! UIPickerView).selectRow(1, inComponent: 0, animated: false)
        perform(#selector(didLoadShowStops), with: nil, afterDelay: 0.5)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    @objc func didLoadShowStops() {
        let mainView = parent as! MainViewController
        let left = list[0][pickerView.selectedRow(inComponent: 0)]
        let right = list[1][pickerView.selectedRow(inComponent: 1)]
        (mainView.table_vc.view.viewWithTag(400) as! UITableViewCell).detailTextLabel?.text = "    \(left)   →   \(right)"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let pickerView = view.viewWithTag(100) as! UIPickerView
        let left = list[0][pickerView.selectedRow(inComponent: 0)]
        let right = list[1][pickerView.selectedRow(inComponent: 1)]
        
        print("起站為 : \(left) , 訖站為 : \(right)")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        switch component {
//        case 0:
//            print("起站 : \(list[component][row])")
//        case 1:
//            print("中繼 : \(list[component][row])")
//        case 2:
//            print("終點 : \(list[component][row])")
//        default:
//            return
//        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

