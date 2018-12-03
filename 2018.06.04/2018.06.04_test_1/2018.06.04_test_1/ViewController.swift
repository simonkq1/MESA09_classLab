//
//  ViewController.swift
//  2018.06.04_test_1
//
//  Created by admin on 2018/6/4.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let list = [["台北","台中","高雄","台南"],["屏東","台東","花蓮"]]
    let headerList = ["西部","東部"]
    var isSessionCollapes: [Bool]! = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var ontapGesture: UITapGestureRecognizer!
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        let section = sender.view?.superview?.tag
        isSessionCollapes[section!] = !isSessionCollapes[section!]
        tableView.reloadSections(IndexSet(integer: section!), with: .automatic)
        print(isSessionCollapes.count)
        print(isSessionCollapes)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        for _ in 0...section {
            if isSessionCollapes.count <= section {
                isSessionCollapes.append(false)
            }
        }
        if isSessionCollapes[section] == false {
            return list[section].count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let v = view as! UITableViewHeaderFooterView
        v.backgroundColor = .black
        v.textLabel?.textAlignment = .center
        v.textLabel?.textColor = .black
        v.tag = section
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture(_:)))
        v.contentView.addGestureRecognizer(tap)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerList[section]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

