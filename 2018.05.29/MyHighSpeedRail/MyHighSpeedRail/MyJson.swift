//
//  MyJson.swift
//  2018.05.29_app3
//
//  Created by admin on 2018/6/12.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class MyJson: NSObject {
    static var UpdateTime: String!
    static var EffectiveDate: String!
    static var ExpiringDate: String!
    class GeneralTimetable: MyJson {
        class GeneralTrainInfo: GeneralTimetable {
            static var TrainNo: String!
            static var Direction: Int!
            static var StartingStationID: String!
            class StartingStationName: GeneralTrainInfo {
                static var Zh_tw: String!
                static var En: String!
            }
            static var EndingStationID: String!
            class EndingStationName: GeneralTrainInfo {
                static var Zh_tw: String!
                static var En: String!
            }
            static var Note: Any!
        }
        static var StopTimes: NSArray!
        static var ServiceDay: NSDictionary!
        
    }
    
    //    static var GeneralTimetable: NSDictionary!
    
    static func getData() -> [[String:Any]] {
        var stopData: [[String:Any]] = []
        do {
            let path = Bundle.main.path(forResource: "StopTime", ofType: "json")
            let url = URL(fileURLWithPath: path!)
            let data = try Data(contentsOf: url)
            let jsonData = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String:Any]]
            
            for i in jsonData {
                MyJson.UpdateTime = i["UpdateTime"] as! String
                let GeneralTimetable = i["GeneralTimetable"] as! NSDictionary
                let GeneralTrainInfo = GeneralTimetable["GeneralTrainInfo"] as! NSDictionary
                //                let StopTimes = GeneralTimetable["StopTimes"] as! NSArray
                //                let ServiceDay = GeneralTimetable["ServiceDay"] as! NSDictionary
                
                MyJson.GeneralTimetable.GeneralTrainInfo.TrainNo = GeneralTrainInfo["TrainNo"] as! String
                MyJson.GeneralTimetable.GeneralTrainInfo.Direction = GeneralTrainInfo["Direction"] as!
                Int
                MyJson.GeneralTimetable.GeneralTrainInfo.StartingStationID = GeneralTrainInfo["StartingStationID"] as! String
                MyJson.GeneralTimetable.GeneralTrainInfo.StartingStationName.Zh_tw = (GeneralTrainInfo["StartingStationName"] as! NSDictionary)["Zh_tw"] as! String
                MyJson.GeneralTimetable.GeneralTrainInfo.StartingStationName.En = (GeneralTrainInfo["StartingStationName"] as! NSDictionary)["En"] as! String
                MyJson.GeneralTimetable.GeneralTrainInfo.EndingStationID = GeneralTrainInfo["EndingStationID"] as! String
                MyJson.GeneralTimetable.GeneralTrainInfo.EndingStationName.Zh_tw =  (GeneralTrainInfo["EndingStationName"] as! NSDictionary)["Zh_tw"] as! String
                MyJson.GeneralTimetable.GeneralTrainInfo.Note = GeneralTrainInfo["Note"] as Any
                MyJson.GeneralTimetable.StopTimes = GeneralTimetable["StopTimes"] as! NSArray
                MyJson.GeneralTimetable.ServiceDay = GeneralTimetable["ServiceDay"] as! NSDictionary
                
                stopData.append([
                    "TrainNo":MyJson.GeneralTimetable.GeneralTrainInfo.TrainNo,
                    "Direction":MyJson.GeneralTimetable.GeneralTrainInfo.Direction,
                    "StartingStationID":MyJson.GeneralTimetable.GeneralTrainInfo.StartingStationID, "StartingStationName":MyJson.GeneralTimetable.GeneralTrainInfo.StartingStationName.Zh_tw,
                    "EndingStationID":MyJson.GeneralTimetable.GeneralTrainInfo.EndingStationID, "EndingStationName":MyJson.GeneralTimetable.GeneralTrainInfo.EndingStationName.Zh_tw,
                    "StopTimes":MyJson.GeneralTimetable.GeneralTrainInfo.StopTimes,
                    "ServiceDay":MyJson.GeneralTimetable.GeneralTrainInfo.ServiceDay
                    ])
                
                
            }
        } catch let error as Error {
            print("读取本地数据出现错误!",error)
        }
        
        return stopData
        
    }
    
    
}

