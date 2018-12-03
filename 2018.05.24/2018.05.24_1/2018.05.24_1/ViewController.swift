//
//  ViewController.swift
//  2018.05.24_1
//
//  Created by admin on 2018/5/24.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    
    
    //MARK: 更新資料
    @IBAction func refreshButtonOnClick(_ sender: Any) {
        
        tableView.alpha = 0
        loadingActivity.startAnimating()
        tableView.isUserInteractionEnabled = true
        
        app.uviData.clearJsonObject()
        app.uviData.loadUVIData()
        app.uviData.setDelegate(self)
        
    }
    //UITableViewDataSource ＆ UITableViewDelegate 不是繼承，是協定
    //ViewController 繼承 UIViewController 並符合 UITableViewDataSource ＆ UITableViewDelegate 的規範
    let app = UIApplication.shared.delegate as! AppDelegate
    var jsonObject: [[String: Any]] = []
    var searchCtrl: UISearchController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //       jsonObject = app.uviData.getJsonObject()
        refreshButton.isEnabled = false
        app.uviData.setDelegate(self)
        tableView.alpha = 0
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "result") as? ResultTVC{
            searchCtrl = UISearchController(searchResultsController: vc)
            searchCtrl.searchResultsUpdater = vc
            searchCtrl.dimsBackgroundDuringPresentation = false
            tableView.tableHeaderView = searchCtrl.searchBar
            
        }
        
    }
    
    func callMeWhenDataReady() {
        //        DispatchQueue.main.async {    //將程序調回主執行緒
        print("dataReady")
        jsonObject = app.uviData.getJsonObject()
        tableView.reloadData()
        loadingActivity.stopAnimating()
        tableView.isUserInteractionEnabled = true
        UIView.animate(withDuration: 1) {
            self.tableView.alpha = 1
        }
        
        refreshButton.isEnabled = true
        //        }
    }
    
    //MARK: - 表格控制三元件
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        //有多少section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonObject.count
        //有多少儲存格
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        //舊的寫法
        //        let tmpCell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        //        if tmpCell == nil {
        //            tmpCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        //        }
        //----------------------
        
        let item = jsonObject[indexPath.row]
        var county: String = "未知"
        var siteName: String = "未知"
        var uvi: String = "未知"
        
        cell.backgroundColor = .white
        cell.imageView?.image = nil
        cell.textLabel?.textColor = UIColor.black
        
        if item["County"] is String {
            county = item["County"] as! String
        }
        if item["SiteName"] is String {
            siteName = item["SiteName"] as! String
        }
        if item["UVI"] is String {
            uvi = item["UVI"] as! String
            cell.backgroundColor = getCellBGColorByUVI(Float(uvi), cell: cell)
        }
        
        //        if Float(uvi) != nil{
        //            switch Float(uvi)! {
        //            case 0.0..<3.0:
        //                cell.backgroundColor = UIColor.green
        //            case 3.0..<6.0:
        //                cell.backgroundColor = UIColor.yellow
        //            case 6.0..<8.0:
        //                cell.backgroundColor = UIColor.orange
        //            case 8.0..<11.0:
        //                cell.backgroundColor = UIColor.red
        //                cell.imageView?.image = UIImage(named: "red")
        //            case 11.0...:
        //                cell.backgroundColor = UIColor.purple
        //            default:
        //                cell.backgroundColor = UIColor.white
        //            }
        //        }
        
        
        cell.textLabel?.text = county + "/" + siteName
        cell.detailTextLabel?.text = uvi
        return cell
    }
    
    
    //MARK: -
    func getCellBGColorByUVI(_ value: Float?, cell: UITableViewCell)->UIColor {
        var color: UIColor = UIColor.white
        guard let value = value else {
            return color
        }
        switch value {
        case 0.0..<3.0:
            color = UIColor(red: 46/255, green: 148/255, blue: 23/255, alpha: 1)
        case 3.0..<6.0:
            color = UIColor(red: 246/255, green: 226/255, blue: 50/255, alpha: 1)
        case 6.0..<8.0:
            color = .orange
        case 8.0..<11.0:
            color = UIColor(red: 241/255, green: 10/255, blue: 38/255, alpha: 1)
            cell.imageView?.image = UIImage(named: "red")
            cell.textLabel?.textColor = UIColor.white
        case 11.0...:
            color = .purple
            cell.imageView?.image = UIImage(named: "danger")
            cell.textLabel?.textColor = UIColor.green
        default:
            break
        }
        return color
    }
    
    var lat_arr: [Substring]? = nil
    var lon_arr: [Substring]? = nil
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "vc_to_mapvc"{
            let indexPath = tableView.indexPathForSelectedRow!
            let item = jsonObject[indexPath.row]
            if item["WGS84Lat"] is String, item["WGS84Lon"] is String{
                lat_arr = (item["WGS84Lat"] as! String).trimmingCharacters(in: .whitespacesAndNewlines).split(separator: ",")
                lon_arr = (item["WGS84Lon"] as! String).trimmingCharacters(in: .whitespacesAndNewlines).split(separator: ",")
                if lat_arr!.count == 3 , lon_arr!.count == 3 {
                    return true
                }
                return false
            }
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vc_to_mapvc"{
            let vc = segue.destination as! MapViewController
            vc.lat_arr =  lat_arr
            vc.lon_arr = lon_arr
        }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

