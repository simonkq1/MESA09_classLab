//
//  TableViewController.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/5/29.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    
    @IBOutlet weak var btnLayout: NSLayoutConstraint!
    @IBOutlet weak var btnLayout2: NSLayoutConstraint!
    @IBOutlet weak var btnLayout3: NSLayoutConstraint!
    
    @IBOutlet weak var btnLayout4: NSLayoutConstraint!
    
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var viewButton2: UIView!
    @IBOutlet weak var viewButton3: UIView!
    @IBOutlet weak var viewButton4: UIView!
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var leftLabel2: UILabel!
    @IBOutlet weak var leftLabel3: UILabel!
    @IBOutlet weak var leftLabel4: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var rightLabel2: UILabel!
    @IBOutlet weak var rightLabel3: UILabel!
    @IBOutlet weak var rightLabel4: UILabel!
    
    
    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var moveLabel2: UILabel!
    @IBOutlet weak var moveLabel3: UILabel!
    @IBOutlet weak var moveLabel4: UILabel!
    
    @IBOutlet weak var universityLabel: UILabel!
    var isTwoWay: Bool = false
    var isNormal: Bool = true
    var isFourDays: Bool = false
    var isHidden: [Bool] = [false,false,false,false,false,false,false,false]
    
    
    @IBAction func tapGesture(_ sender: Any) {
            if btnLayout.constant == 4 {
                btnLayout.constant = rightLabel.frame.size.width - 3
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
                leftLabel.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
                rightLabel.textColor = UIColor.white
                
                isTwoWay = !isTwoWay
                
                tableView.beginUpdates()
                tableView.endUpdates()
            }else {
                btnLayout.constant = 4
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
                rightLabel.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
                leftLabel.textColor = UIColor.white
                
                //            moveLabel.text = "單程票"
                isTwoWay = !isTwoWay
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        
        
    }
    
    @IBAction func tapGesture2(_ sender: Any) {
        let mainView = parent as! MainViewController
        if btnLayout2.constant == 4 {
            btnLayout2.constant = rightLabel2.frame.size.width - 3
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            leftLabel2.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
            rightLabel2.textColor = UIColor.white
            
            isNormal = false
            universityLabel.text = ""
            tableView.beginUpdates()
            tableView.endUpdates()
        }else {
            btnLayout2.constant = 4
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            rightLabel2.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
            leftLabel2.textColor = UIColor.white
            //            moveLabel.text = "單程票"
            isNormal = true
            universityLabel.text = "大學生 \(mainView.ticket_vc.list[4][mainView.ticket_vc.pickerView.selectedRow(inComponent: 4)])"
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        
        
    }
    
    @IBAction func tapGesture3(_ sender: Any) {
        let mainView = parent as! MainViewController
        if btnLayout3.constant == 4 {
            btnLayout3.constant = rightLabel3.frame.size.width - 3
            mainView.sitPickerConstrsint.constant = 0
            UIView.animate(withDuration: 0.5) {
                mainView.view.layoutIfNeeded()
                self.view.layoutIfNeeded()
            }
            
            mainView.bgConstraint.constant = 0
            mainView.tabBarController?.tabBar.isHidden = true
            leftLabel3.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
            rightLabel3.textColor = UIColor.white
            
        }else {
            btnLayout3.constant = 4
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            rightLabel3.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
            leftLabel3.textColor = UIColor.white
            rightLabel3.text = "請選擇"
            
        }
        
    }
    
    @IBAction func tapGesture4(_ sender: Any) {
        if btnLayout4.constant == 4 {
            btnLayout4.constant = rightLabel4.frame.size.width - 3
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            leftLabel4.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
            rightLabel4.textColor = UIColor.white
        }else {
            btnLayout4.constant = 4
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            rightLabel4.textColor = UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
            leftLabel4.textColor = UIColor.white
        }
    }
    
    
    @IBOutlet weak var showStops: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        
        
        
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            break
        case 1:
            break
        case 2:
            if isTwoWay == false {
                return 0
            }
        case 3:
            break
        case 4:
            break
        case 5:
            if isNormal == false {
                return 0
            }else if isFourDays == false, isHidden[5] == true{
                return 0
            }else if isFourDays == true, isHidden[5] == true {
                return 0
            }else if isFourDays == false {
                return 0
            }else {
                return 60
            }
            
        case 6:
            if isHidden[6] == true {
                return 0
            }
        case 7:
            if isNormal == true {
                return 100
            }else {
                return 65
            }
        default:
            break
        }
        
        return 60
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainView = parent as! MainViewController
        switch indexPath.row {
        case 0:
            mainView.buttonConstraint.constant = 0
            UIView.animate(withDuration: 0.5) {
                mainView.view.layoutIfNeeded()
            }
            mainView.bgConstraint.constant = 0
            mainView.tabBarController?.tabBar.isHidden = true
            
        case 1:
            mainView.dateConstraint.constant = 0
            UIView.animate(withDuration: 0.5) {
                mainView.view.layoutIfNeeded()
            }
            mainView.bgConstraint.constant = 0
            mainView.tabBarController?.tabBar.isHidden = true
        case 2:
            
            mainView.returnDateConstraint.constant = 0
            UIView.animate(withDuration: 0.5) {
                mainView.view.layoutIfNeeded()
            }
            mainView.bgConstraint.constant = 0
            mainView.tabBarController?.tabBar.isHidden = true
        case 5:
            break
        case 6:
            break
        case 7:
//            let adult = ((view.viewWithTag(700) as! UITableViewCell).viewWithTag(10) as! UILabel)
//            let child = ((view.viewWithTag(700) as! UITableViewCell).viewWithTag(20) as! UILabel)
//            let old = ((view.viewWithTag(700) as! UITableViewCell).viewWithTag(30) as! UILabel)
//            let heart = ((view.viewWithTag(700) as! UITableViewCell).viewWithTag(40) as! UILabel)
//            let university = ((view.viewWithTag(700) as! UITableViewCell).viewWithTag(50) as! UILabel)
            mainView.ticketNumberConstraint.constant = 0
            mainView.tableViewTopConstraint.constant = -155
            UIView.animate(withDuration: 0.5) {
                mainView.view.layoutIfNeeded()
            }
            mainView.bgConstraint.constant = 0
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
                mainView.tabBarController?.tabBar.isHidden = true
            }
            if isNormal == false {
                mainView.ticket_vc.isNormal = true
                mainView.ticket_vc.universityLable.isHidden = false
                mainView.ticket_vc.pickerView.reloadAllComponents()
            }else {
                mainView.ticket_vc.isNormal = false
                mainView.ticket_vc.universityLable.isHidden = true
                mainView.ticket_vc.pickerView.reloadAllComponents()
            }
        default:
            break
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        
        viewButton.viewButtonStyle()
        moveLabel.moveLabelStyle()
        viewButton2.viewButtonStyle()
        moveLabel2.moveLabelStyle()
        viewButton3.viewButtonStyle()
        moveLabel3.moveLabelStyle()
        viewButton4.viewButtonStyle()
        moveLabel4.moveLabelStyle()
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
 */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
