//
//  ShowTableViewController.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/6/12.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ShowTableViewController: UITableViewController {
    static var list: [NSDictionary] = []
    var header: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return ShowTableViewController.list.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ShowTableViewController.list[section].count
    }
    
    var l = 0
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var title: [String] = []
        var text: [Any] = []
        //        var stopSequence:[Int] = []
        //        var data: [[String: String]] = []
        
        
        for (k, v) in ShowTableViewController.list[indexPath.section] {
            title.append(k as! String)
            text.append(v)
        }
        cell.textLabel?.text = title[indexPath.row]
        
        if title[indexPath.row] == "StopSequence" {
            cell.detailTextLabel?.text = "\(text[indexPath.row])"
        }else if title[indexPath.row] == "StationName" {
            let StationName = (text[indexPath.row] as! NSDictionary)["Zh_tw"] as! String
            cell.detailTextLabel?.text = "\(StationName)"
        }else {
            cell.detailTextLabel?.text = text[indexPath.row] as? String
        }
        
        
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        print(l)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        for i in 0...section {
            header.append(i)
        }
        return String(header[section])
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
