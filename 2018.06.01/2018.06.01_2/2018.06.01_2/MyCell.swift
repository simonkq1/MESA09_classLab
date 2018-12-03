//
//  MyCell.swift
//  2018.06.01_2
//
//  Created by admin on 2018/6/1.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var proudctName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var unitPrice: UITextField!
//    let list = [["鉛筆","橡皮擦","膠水"]]
    static private var list: [[String]] = [[]]
    
    @IBAction func onDone(_ sender: Any) {
        let price: Int!
        price = Int(unitPrice.text!) ?? 0
        if unitPrice.text == "" || price == 0{
            showAlert("價格未設定")
            return
        }
        if proudctName.text == "鉛筆", price > 5 {
            showAlert("價格設定錯誤")
            return
        }
        if proudctName.text == "橡皮擦", price > 10 {
            showAlert("價格設定錯誤")
            return
        }
        if proudctName.text == "膠水", price > 20 {
            showAlert("價格設定錯誤")
            return
        }
        print("AAA")
    }
    
    func showAlert(_ msg: String){
        let alert = UIAlertController(title: "警告", message: msg, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okBtn)
        // =====================
        let app = UIApplication.shared.delegate as! AppDelegate
        app.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - 增加資料
   static func loadData() -> [[String]] {
    MyCell.listAppend(dataInSection: 0, "鉛筆", "橡皮擦", "膠水")
    return MyCell.list
    }
    
  static private func listAppend(dataInSection section: Int ,_ product: String ...) {
        if MyCell.list.count < section + 1{
            for _ in 0 ..< ((section + 1) - MyCell.list.count){
                MyCell.list.append([])
            }
        }
        for i in 0..<product.count {
            MyCell.list[section].append(product[i])
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
