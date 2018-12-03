//
//  TableViewController.swift
//  JsonData
//
//  Created by admin on 2018/6/12.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let application = UIApplication.shared.delegate as! AppDelegate
    var data: [[String:Any]]!
    var header:[String] = []
    var stopTimesData: [NSDictionary] = []
    var serviceDay: [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        data = application.jsonData
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        

        return data[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var mytitle: [String] = []
        var mydata: [Any] = []
        
        cell.accessoryType = .none
        
        for (k, v) in data[indexPath.section] {
            mytitle.append(k as! String)
            mydata.append(v)
        }
//        print(mydata[indexPath.row])
        
        
        cell.textLabel?.text = mytitle[indexPath.row]
        if mytitle[indexPath.row] == "ServiceDay" {
            cell.accessoryType = .disclosureIndicator
            cell.detailTextLabel?.text = ""
        }else if mytitle[indexPath.row] == "StopTimes"{
            cell.accessoryType = .disclosureIndicator
            cell.detailTextLabel?.text = ""
        }else if mytitle[indexPath.row] == "Direction" {
            cell.detailTextLabel?.text = "\(mydata[indexPath.row] as! Int)"
        }else {
            cell.detailTextLabel?.text = mydata[indexPath.row] as! String
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.textLabel?.text == "StopTimes" {
            stopTimesData = []
            let showList = storyboard?.instantiateViewController(withIdentifier: "show_vc")
            let list = data[indexPath.section]["StopTimes"]
//            print(list)
            for i in list as! NSArray {
                stopTimesData.append(i as! NSDictionary)
            }
//            print(stopTimesData)
            
            ShowTableViewController.list = stopTimesData
            
            show(showList!, sender: nil)
        }
        if tableView.cellForRow(at: indexPath)?.textLabel?.text == "ServiceDay" {
            serviceDay = []
            let showList = storyboard?.instantiateViewController(withIdentifier: "serviceday_vc")
            let list = data[indexPath.section]["ServiceDay"]
            //            print(list)
            for (k, v) in list as! NSDictionary {
                serviceDay.append([k:v])
            }
            
            ServiceDayTableViewController.list = serviceDay
            
            show(showList!, sender: nil)
        }
        
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let v = view as! UITableViewHeaderFooterView
        v.textLabel?.textAlignment = .center
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        for i in 1...section + 1 {
            header.append(String(i))
        }
        let headerText = "車次 : \(data[section]["TrainNo"] as! String)"
        return headerText
    }
    
    


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
