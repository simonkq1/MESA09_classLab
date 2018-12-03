//
//  SitChoiceViewController.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/6/11.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class SitChoiceViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let sit = ["靠窗","走道"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func okAction(_ sender: Any) {
        let mainView = parent as! MainViewController
        mainView.sitPickerConstrsint.constant = -330
        UIView.animate(withDuration: 0.5) {
            mainView.view.layoutIfNeeded()
        }
        mainView.bgConstraint.constant = -667
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { (timer) in
            mainView.tabBarController?.tabBar.isHidden = false
        }
        
        
        
        mainView.table_vc.rightLabel3.text = sit[pickerView.selectedRow(inComponent: 0)]
    }
    @IBAction func cancelAction(_ sender: Any) {
        let mainView = parent as! MainViewController
        mainView.sitPickerConstrsint.constant = -330
        mainView.table_vc.btnLayout3.constant = 4
        UIView.animate(withDuration: 0.5) {
            mainView.table_vc.view.layoutIfNeeded()
            mainView.view.layoutIfNeeded()
        }
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { (timer) in
            mainView.tabBarController?.tabBar.isHidden = false
        }
        
        mainView.table_vc.rightLabel3.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
        mainView.table_vc.leftLabel3.textColor = UIColor.white
        mainView.bgConstraint.constant = -667
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sit.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sit[row]
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
