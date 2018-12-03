//
//  ViewController.swift
//  2018.06.04_1
//
//  Created by admin on 2018/6/4.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testField: UITextField!
    let user = UserDefaults()
    
    var src, dst: String!
    let fm = FileManager.default
    let path = NSHomeDirectory() + "/Documents"
    let tmp = NSHomeDirectory() + "/tmp/a.txt"
    var list: [[String:String]]!
    
    @IBOutlet weak var iidText: UITextField!
    @IBOutlet weak var cnameText: UITextField!
    @IBAction func putBtn(_ sender: Any) {
        
        src = path + "/data"
        do{
            try fm.createDirectory(atPath: src, withIntermediateDirectories: true, attributes: nil)
            print("OK")
        } catch {
            print("error")
        }
    }
    @IBAction func getBtn(_ sender: Any) {
        dst = src + "/a.txt"
        let data = "hello, World".data(using: .utf8)
        if fm.createFile(atPath: dst, contents: data, attributes: nil) {
            print("finish")
        }else {
            print("error")
        }
    }
    
    @IBAction func moveBtn(_ sender: Any) {
        do {
            try fm.moveItem(atPath: path + "/data", toPath: NSHomeDirectory() + "/tmp/data")
            print("move success")
        }catch {
            print("move error")
        }
    }
    
    @IBAction func writeBtn(_ sender: Any) {
        
        let path = NSHomeDirectory() + "/Documents/MyList.plist"
        if let plist = NSMutableDictionary(contentsOfFile: path) {
            if let color = plist["Color"] {
                print("color = \(color)")
            }
            
            plist["Color"] = "Green"
            
            if plist.write(toFile: path, atomically: true){
                print("write success")
            }
        }
    }
    
    
    @IBAction func insertBtn(_ sender: Any) {
        if iidText.text != "", cnameText.text != "" {
            DMDatabase.share.writeData(iid: iidText.text!, cname: cnameText.text!)
        }
    }
    
    @IBAction func loadBtn(_ sender: Any) {
//        let iid = String(list[0]["iid"]!)
//        let cname = String(list[0]["cname"]!)
        list = DMDatabase.share.loadData()
        for i in list {
            for (key, value) in i {
                print("\(key) : \(value)")
            }
        }
//        print("\(iid) : \(cname)")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        iidText.resignFirstResponder()
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let x = DMDatabase.share.loadData()
//        list = DMDatabase.share.loadData()
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

