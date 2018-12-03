//
//  MyAlert.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/6/11.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class MyAlert: UIViewController {

    @IBOutlet weak var iconViewOutside: UIView!
    @IBOutlet weak var iconViewInside: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertTitleLabel: UILabel!
    @IBOutlet weak var alertText: UILabel!
    
   static var buttonIsExist: [Bool] = [true, true]
    
    @IBOutlet weak var cancelWidth: NSLayoutConstraint!
    
    @IBOutlet weak var okWidth: NSLayoutConstraint!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var okBtn: UIButton!
    
    static var myAlertTitle: String!
    static var myAlertText: String!
    static var okBtnText: String = "確定"
    static var cancelBtnText: String = "取消"
    static var fontsize: CGFloat = 20
    
    static var errorType: Int = 0
    static var searchData: [String: Any] = [:]
    
    
    let tivketView = TicketPickerViewController()
    @IBAction func cancelButtonAction(_ sender: Any) {
            dismiss(animated: false, completion: nil)
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        switch MyAlert.errorType {
        case 0:
            dismiss(animated: false, completion: nil)
            break
        case 1:
            SearchViewController.searchData = MyAlert.searchData
            MainViewController.viewdidAction = true
            dismiss(animated: false, completion: nil)
            break
        default:
            break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        okBtn.titleLabel?.font = UIFont(name: "System", size: MyAlert.fontsize)

        // Do any additional setup after loading the view.
        
        alertView.layer.cornerRadius = 15
        
        
        iconViewInside.layer.borderWidth = 1
        iconViewInside.layer.borderColor = UIColor(red: 255/255, green: 147/255, blue: 0/255, alpha: 1).cgColor
        iconViewInside.layer.cornerRadius = 7
        iconViewOutside.addBorder(withColor: UIColor(red: 255/255, green: 147/255, blue: 0/255, alpha: 1).cgColor, andThickness: 1.5)
        
        if MyAlert.buttonIsExist[0] != true {
            cancelBtn.isHidden = true
            okWidth.setMultiplier(multiplier: 1)
        }
        if MyAlert.buttonIsExist[1] != true {
            okBtn.isHidden = true
            cancelWidth.setMultiplier(multiplier: 1)
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        okBtn.titleLabel?.text = MyAlert.okBtnText
        cancelBtn.titleLabel?.text = MyAlert.cancelBtnText
        alertTitleLabel.text = MyAlert.myAlertTitle
        alertText.text = MyAlert.myAlertText
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
