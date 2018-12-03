//
//  DMDatabase.swift
//  2018.06.04_1
//
//  Created by admin on 2018/6/4.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import SQLite3

class DMDatabase: NSObject {
    
    let fm = FileManager.default
//    var db: OpaquePointer? = nil
    private static var _instance: DMDatabase? = nil
    private static var _db: OpaquePointer? = nil
    
    static var share: DMDatabase {
        get {
            if _instance == nil {
                _instance = DMDatabase()
                if let dst = _instance?.copyToSandBoxDocuments() {
                    if sqlite3_open(dst, &_db) == SQLITE_OK {
                        print("open database success")
                    }else {
                        print("open database error")
                        _db = nil
                    }
                    
                }
            }
            return _instance!
        }
    }
    
//    func openSqlite(_ path: String) {
//        if sqlite3_open(path, &db) == SQLITE_OK {
//            print("open database success")
//        }else {
//            print("open database fail")
//            db = nil
//        }
//    }
   static func closeSqlite() {
        guard DMDatabase._db != nil else{
            return
        }
        sqlite3_close(DMDatabase._db!)
    }
    
    
    func copyToSandBoxDocuments() -> String? {
        let dst = NSHomeDirectory() + "/Documents/mydb.sqlite"
        let src = Bundle.main.path(forResource: "mydb", ofType: "sqlite")
        if !fm.fileExists(atPath: dst){
            do{
                try! fm.moveItem(atPath: src!, toPath: dst)
            }
        }
        return dst
    }
    
    func writeData(iid: String, cname: String) {
        let cnameS = cname.cString(using: .utf8)
        let iidS = iid.cString(using: .utf8)
        let sql = "INSERT INTO UserData VALUES (?, ?, null)"
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare(DMDatabase._db, sql, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(DMDatabase._db))
            print("write prepare error : \(errmsg)")
        }
        
        if sqlite3_bind_text(statement, 1, iidS, -1, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(DMDatabase._db))
            print("write bind1 error : \(errmsg)")
        }
        if sqlite3_bind_text(statement, 2, cnameS, -1, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(DMDatabase._db))
            print("write bind2 error : \(errmsg)")
        }
        
        if sqlite3_step(statement) == SQLITE_DONE {
            print("write insert data success")
        }else {
            let errmsg = String(cString: sqlite3_errmsg(DMDatabase._db))
            print("write bind3 error : \(errmsg)")
            
        }
        sqlite3_finalize(statement)
        
    }
    
    func loadData() -> [[String:String]] {
        var list:[[String:String]] = []
        if DMDatabase._db != nil {
            let tmp = "李大媽".cString(using: .utf8)
            let sql = "select * from UserData"// where cname = ?"
            var statement: OpaquePointer? = nil
            
            var a: String!
            var b: String!
            if sqlite3_prepare(DMDatabase._db, sql, -1, &statement, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(DMDatabase._db))
                print("load prepare error : \(errmsg)")
            }
//            if sqlite3_bind_text(statement, 1, tmp, -1, nil) != SQLITE_OK {
//                let errmsg = String(cString: sqlite3_errmsg(DMDatabase._db))
//                print("load bind1 error : \(errmsg)")
//            }
            
            while sqlite3_step(statement) == SQLITE_ROW {
                let iid = sqlite3_column_text(statement, 0)
                let cname = sqlite3_column_text(statement, 1)
                let columnName1 = String(cString: sqlite3_column_name(statement, 0))
                let columnName2 = String(cString: sqlite3_column_name(statement, 1))
                print(columnName2)
                
                
                if iid != nil {
                    let iidS = String(cString: iid!)
                    a = iidS
                    print("帳號 : \(iidS)")
                    
                }
                
                if cname != nil {
                    let cnameS = String(cString: cname!)
                    b = cnameS
                    print("帳號 : \(cnameS)")
                }
                list.append([columnName1:a,columnName2:b])
                
            }
            sqlite3_finalize(statement)
            print(list)
        }
        
        return list
    }
    
    

}
