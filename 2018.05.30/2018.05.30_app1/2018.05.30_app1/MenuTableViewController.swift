//
//  MenuTableViewController.swift
//  2018.05.30_app1
//
//  Created by admin on 2018/5/30.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    
    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {

        (parent as! ViewController).leadingConstrant.constant = -260
        UIView.animate(withDuration: 0.3) {
            (self.parent as! ViewController).view.layoutIfNeeded()
        }

        (parent as! ViewController).backgroundConstrant.constant = -400
        UIView.animate(withDuration: 0.3) {
            (self.parent as! ViewController).view.layoutIfNeeded()
        }
    }
    
    var locationX :CGFloat!
    @IBAction func bgPanGesture(_ sender: UIPanGestureRecognizer) {
        
        let mainView = self.parent as! ViewController
        let location = sender.location(in: mainView.view)
        
        //        print(location)
        
        switch sender.state {
        case .began:
            mainView.origionalX = location.x
            locationX = location.x
        case .ended:
            
            if location.x > locationX {
                mainView.backgroundConstrant.constant = -140
                UIView.animate(withDuration: 0.5) {
                    mainView.view.layoutIfNeeded()
                }
            }else if location.x < locationX {
                
                mainView.backgroundConstrant.constant = -400
                UIView.animate(withDuration: 0.5) {
                    mainView.view.layoutIfNeeded()
                }
            }
            if mainView.leadingConstrant.constant > 0 {
                mainView.leadingConstrant.constant = 0
                UIView.animate(withDuration: 0.5) {
                    mainView.view.layoutIfNeeded()
                }
                
            }
            
            if location.x < locationX {
                mainView.leadingConstrant.constant = -260
                UIView.animate(withDuration: 0.5) {
                    mainView.view.layoutIfNeeded()
                }
            }
            
            
//            if mainView.leadingConstrant.constant > -1 {
//                locationX = 260
//            }else if mainView.leadingConstrant.constant < 1{
//                locationX = 0
//            }
//            print(locationX)
        case .changed:
            //            print(location)
//            if location.x < locationX {
//
//            }
//            print(locationX)
            if mainView.backgroundConstrant.constant < 0 {
                mainView.backgroundConstrant.constant = -400 + location.x
            }
            if location.x < locationX {
                    mainView.leadingConstrant.constant = location.x - locationX
                
            }else if location.x > locationX {
                if mainView.leadingConstrant.constant < 0 {
                    mainView.leadingConstrant.constant = location.x - locationX
                }
            }
        default:
            break
        }
    }

    
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
    /*
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     return 0
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
