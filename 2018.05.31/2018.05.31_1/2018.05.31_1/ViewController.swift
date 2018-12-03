//
//  ViewController.swift
//  2018.05.31_1
//
//  Created by admin on 2018/5/31.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    
    let list = [[ "🇹🇼", "台北\n基隆\n新北", "台中", "高雄\n台南"],[ "AAA", "BBB", "CCC", "DDD"]]
    let titleList = ["行政區","AAA"]
//    var isCollapse: Bool = true
    var collapes: [Bool] = []
    var isSectionCollapes: [Bool] = []
    
    
    var tag = 0
    @IBOutlet var tapGestureOutlet2: UITapGestureRecognizer!
    @IBOutlet var tapGestureOutlet: UITapGestureRecognizer!
    var arr: [[UITapGestureRecognizer]] = []
    @IBOutlet weak var tableView: UITableView!
    @IBAction func tapGestureAction(_ sender: Any) {
        isSectionCollapes[0] = !isSectionCollapes[0]
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    @IBAction func tapGestureAction2(_ sender: Any) {
        isSectionCollapes[1] = !isSectionCollapes[1]
        tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        lable.textAlignment = .center
    }
    
    // MARK: 表格第一階段對話
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    // MARK: 表格第二階段對話
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        if isSectionCollapes == true {
        //            return 0
        //        }
        //        return list.count
        //        print(section)
        for _ in 0...section {
            if collapes.count <= section {
                collapes.append(true)
            }
            if isSectionCollapes.count <= section{
                isSectionCollapes.append(false)
            }
        }
        
        return isSectionCollapes[section] ? 0 : list[section].count
    }
    
    // MARK: 表格第三階段對話
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.numberOfLines = 0
//                print(indexPath)
        cell.textLabel?.text = list[indexPath.section][indexPath.row]
        return cell
    }
    
    // MARK: - 表格儲存格高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row != 0, collapes[indexPath.section] == true{
            return 0
        }
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //        tableView.tableHeaderView
        
        
        
        return titleList[section]
        
    }
    var aaa: [UITapGestureRecognizer] = []
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let v = view as! UITableViewHeaderFooterView
        v.textLabel?.textAlignment = .center
        
        
        switch v.textLabel?.text {
        case "行政區":
            tag = 10
            v.contentView.tag = tag
            //                print(v.contentView.tag)
            v.contentView.viewWithTag(10)?.addGestureRecognizer(tapGestureOutlet)
        case "AAA":
            
            tag = 20
            v.contentView.tag = tag
            //                print(v.contentView.tag)
            v.contentView.viewWithTag(20)?.addGestureRecognizer(tapGestureOutlet2)
        default:
            break
        }
        
        
    }
    
    // MARK: 取得被點選的儲存格
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            collapes[indexPath.section] = !collapes[indexPath.section]
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        //        print(indexPath.section)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

