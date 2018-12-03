//
//  ViewController.swift
//  2018.06.01_1
//
//  Created by admin on 2018/6/1.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func valueChanged(_ sender: UISwitch) {
        let lable = sender.superview?.viewWithTag(10)
        lable?.backgroundColor = (sender.isOn) ? .blue : .red
    }
    let list = [["台北","台中\n一二三\n四五六","高雄"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let lable = cell.viewWithTag(10) as! UILabel
        lable.numberOfLines = 0
        tableView.rowHeight = UITableViewAutomaticDimension
        lable.text = list[indexPath.section][indexPath.row]
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

