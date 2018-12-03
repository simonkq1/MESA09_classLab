//
//  OpenData.swift
//  2018.05.24_1
//
//  Created by admin on 2018/5/24.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class OpenData: NSObject {
    
    private var jsonObject: [[String: Any]] = []
    private var stop: Bool = false
//    var vc: ViewController!
    
    func loadUVIData() {
        if jsonObject.count == 0 {
            loadJsonObject()
        }
        
        if jsonObject.count != 0 {
            return
        }
        let q = DispatchQueue.global()      //開啟多執行緒
        q.async {
            sleep(5)
            if let url = URL(string: "http://opendata2.epa.gov.tw/UV/UV.json") {
                do{
                    let data = try Data(contentsOf: url)
                    self.jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
                    self.saveJsonObject()
//                    DispatchQueue.main.async {  //將程序調回主執行緒
//                        self.vc.whenDataReadyCallMe()
//                    }
                } catch {
                    print(error)
                    self.stop = true
                }
            }
        }
    }
    
    
    func setDelegate(_ vc: ViewController) {
//        self.vc = vc
        DispatchQueue.global().async {
            while self.jsonObject.count == 0, self.stop != true {
                sleep(1)
            }
            DispatchQueue.main.async {
                vc.callMeWhenDataReady()
            }
        }
    }
    
    func getJsonObject() ->[[String:Any]] {
        return jsonObject
    }
    
    private func saveJsonObject(){
        let user = UserDefaults.standard
        user.set(jsonObject, forKey: "myUVI")
    }
    
    private func loadJsonObject(){
        let user = UserDefaults.standard
        jsonObject = user.object(forKey: "myUVI") as? [[String:Any]] ?? []
    }
    
    func clearJsonObject(){
        let user = UserDefaults.standard
        user.removeObject(forKey: "myUVI")
        jsonObject.removeAll()
    }
    
    
    
    
}
