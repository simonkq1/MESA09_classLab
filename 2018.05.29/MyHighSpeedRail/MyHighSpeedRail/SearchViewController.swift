//
//  SearchViewController.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/6/13.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let application = UIApplication.shared.delegate as! AppDelegate
    var data: [[String:Any]]!
    var header:[String] = []
    var stopTimesData: [NSDictionary] = []
    var serviceDay: [NSDictionary] = []
    static var searchData: [String:Any] = [:]
    var showList: [String:String] = [:]
    var listStartData: [[String:String]] = []
    var listStartStation: [String] = []
    var listEndData: [[String:String]] = []
    var listEndStation: [String] = []
    var listTrainNo: [String] = []
    var listData: [[String:String]] = []
    var showNumber: Int = 0
    var sorted: [[String:String]] = []
    static var alertShow: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startStationName: UILabel!
    @IBOutlet weak var endStationName: UILabel!
    var trainNo: UILabel!
    var startStationTime: UILabel!
    var endStationTime: UILabel!
    var duringTime: UILabel!
    
    @IBOutlet weak var earlierBtn: UIButton!
    @IBOutlet weak var laterBtn: UIButton!
    @IBAction func earlierAction(_ sender: Any) {
        if showNumber >= 5 {
            showNumber -= 5
            tableView.reloadData()
        }
//        tableView.endUpdates()
    }
    @IBAction func laterAction(_ sender: Any) {
        print("\(showNumber) : \(listData.count - (listData.count % 5) - 5)")
        if showNumber <= listData.count - (listData.count % 5) - 5 {
            showNumber += 5
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if SearchViewController.alertShow == true {
            let navi = UINavigationController(rootViewController: MainViewController())
            self.navigationController?.pushViewController(navi, animated: false)
        }
        
        let backItem = UIBarButtonItem(title: "重新查詢", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        data = application.jsonData
        let titleDAteFormatter = DateFormatter()
        titleDAteFormatter.dateFormat = "YYYY/MM/dd"
        
        let titileDate = titleDAteFormatter.string(from: SearchViewController.searchData["goTime"] as! Date)
        if SearchViewController.searchData["isTwoWay"] as! Bool == true {
            
            title = "\(titileDate) 去程"
        }else {
            
            title = "\(titileDate) 單程"
        }
        let stackView = view.viewWithTag(100) as! UIStackView
        stackView.layer.backgroundColor = UIColor.white.cgColor
        let shapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: stackView.frame.minX, y: stackView.frame.size.height))
        linePath.addLine(to: CGPoint(x: stackView.frame.maxX + 500, y: stackView.frame.size.height))
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 0.5
        shapeLayer.path = linePath.cgPath
        view.layer.addSublayer(shapeLayer)
        earlierBtn.layer.borderColor = UIColor.white.cgColor
        earlierBtn.layer.borderWidth = 1
        laterBtn.layer.borderColor = UIColor.white.cgColor
        laterBtn.layer.borderWidth = 1
        
        let mydata = SearchViewController.searchData
        let start = mydata["startStation"] as! String
        let end = mydata["endStation"] as! String
        startStationName.text = start
        endStationName.text = end
        
        checkData()
        
    }
    @objc func goBack() {
        
        dismiss(animated: false, completion: nil)
    }
    @objc func toReturn() {
        ReturnSearchViewController.searchData = SearchViewController.searchData
        let searchReturn = storyboard?.instantiateViewController(withIdentifier: "returnlist_vc")
//        present(searchReturn!,animated: true,completion: nil)
        self.show(searchReturn!, sender: nil)
    }
    
    func checkData() {
        
        var train: String!
        for i in data {
            var isService: Bool!
            for (k, v) in i {
                if k == "TrainNo" {
                    train = v as! String
                }
                if k == "ServiceDay" {
                    
                    let weekformatter = DateFormatter()
                    weekformatter.dateFormat = "eeee"
                    let week = weekformatter.string(from: SearchViewController.searchData["goTime"] as! Date)
                    //                    print(aaa)
                    let serviceDay = v as! NSDictionary
                    for (w, t) in serviceDay {
                        if w as! String == week {
                            if t as! Int == 0 {
                                isService = false
//                                print("\(isService) \(train)")
                            }else if t as! Int == 1 {
                                isService = true
//                                print("\(isService) \(train)")
                            }
                            
                        }
                    }
                    print(serviceDay["Friday"] as! Int)
                }
                if k == "StopTimes" {
                    let list = (v as! NSArray)
                    
                    var starttmp: String = ""
                    var endtmp: String = ""
                    var startStopSequence: Int = 0
                    var endStopSequence: Int = 0
                    var startTimeTmp: Date!
                    var endTimeTmp: Date!
                    var duringTmp: String!
                    
                    for j in list {
                        
                        let newList = j as! NSDictionary
                        
                        let formatter = DateFormatter()
                        formatter.dateFormat = "HH:mm"
                        let newDate = (formatter.date(from: newList["DepartureTime"] as! String))! + (8 * 60 * 60)
                        let searchDate = SearchViewController.searchData["goTime"] as! Date
                        let searchDateB = formatter.string(from: searchDate)
                        let newSearchDate = (formatter.date(from: searchDateB))! + (8 * 60 * 60)
                        
                        let start = (SearchViewController.searchData["startStation"] as! String)
                        let stationName = ((newList["StationName"] as! NSDictionary)["Zh_tw"]) as! String
                        let string = formatter.string(from: newDate - (8 * 60 * 60))
                        
                        //                        print(newDate)
                        let end = (SearchViewController.searchData["endStation"] as! String)
                        
                        
                        
                        if newSearchDate <= newDate, start == stationName {
                            //                            print("\(newDate)  :  \(string)")
                            starttmp = string
                            startStopSequence = newList["StopSequence"] as! Int
                            startTimeTmp = newDate
                            //                            print(train)
                        }
                        if newSearchDate <= newDate, end == stationName {
                            endtmp = string
                            endTimeTmp = newDate
                            endStopSequence = newList["StopSequence"] as! Int
                        }
                        //                        print("\(listStartData[int]) : \(listEndData[int])")
                        if endStopSequence > startStopSequence {
                            if starttmp != "", endtmp != "" {
                                if isService == true {
                                    
                                    let components = Calendar.current.dateComponents([.minute], from: startTimeTmp , to: endTimeTmp).minute
                                    
                                    if components! >= 60 {
                                        let a = components! % 60
                                        if a < 10 {
                                            duringTmp = "\(components! / 60):0\(components! % 60)"
                                        }else {
                                            duringTmp = "\(components! / 60):\(components! % 60)"
                                        }
                                    }else if components! < 10{
                                        duringTmp = "0:0\(components!)"
                                    }else {
                                        duringTmp = "0:\(components!)"
                                    }
                                    //                                print(components)
                                    
                                    if listData.count != 0 {
                                        if train != listData[listData.count - 1]["trainNo"] {
                                            listTrainNo.append(train)
                                            listData.append(["trainNo":train,"start":starttmp,"end":endtmp,"duringTime":duringTmp])
                                            listStartData.append([start:starttmp])
                                            listEndData.append([end:endtmp])
                                        }
                                    }else if listData.count == 0 {
                                        listTrainNo.append(train)
                                        listData.append(["trainNo":train,"start":starttmp,"end":endtmp,"duringTime":duringTmp])
                                        listStartData.append([start:starttmp])
                                        listEndData.append([end:endtmp])
                                    }
                                    
                                }
                            }
                        }
                    }
                    
//                    print("--------------------------------")
                }
            }
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        return listData.count - showNumber
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        trainNo = cell.viewWithTag(10) as! UILabel
        startStationTime = cell.viewWithTag(20) as! UILabel
        endStationTime = cell.viewWithTag(30) as! UILabel
        duringTime = cell.viewWithTag(40) as! UILabel
        
        //        print(listData)
        
        sorted = listData.sorted { (d1, d2) -> Bool in
            return d1["start"]! < d2["start"]!
        }
        sorted.removeFirst(showNumber)
        print("\(sorted.count) : \(indexPath.section)")
        let a:Substring!
        a = sorted[indexPath.row]["trainNo"]?.dropFirst()
        trainNo.text = (sorted[indexPath.row]["trainNo"]?.hasPrefix("0"))! ? String(a) : sorted[indexPath.section]["trainNo"]
        startStationTime.text = sorted[indexPath.row]["start"]
        endStationTime.text = sorted[indexPath.row]["end"]
        duringTime.text = sorted[indexPath.row]["duringTime"]
        
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        //        print(listData)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if SearchViewController.searchData["isTwoWay"] as! Bool == true {
            toReturn()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / 5
    }
    
    
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        for i in 0...section + 1 {
    //            header.append(String(i))
    //        }
    //        return header[section]
    //    }
    
    
    
    
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
