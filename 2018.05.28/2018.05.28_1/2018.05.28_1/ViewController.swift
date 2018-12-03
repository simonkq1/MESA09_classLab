//
//  ViewController.swift
//  2018.05.28_1
//
//  Created by admin on 2018/5/28.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var errorMessage: UILabel!
    @IBAction func onClick(_ sender: Any) {
        let alert = UIAlertController(title: "Login", message: "enter account and password", preferredStyle: .alert)
        let url = URL(string: "http://localhost/swift/logincheck.php")
        var request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        let okAction = UIAlertAction(title: "登入", style: .default) { (action) in
            
            let uid = alert.textFields![0].text
            let pwd = alert.textFields![1].text
            print("帳號：\(uid!)")
            print("密碼：\(pwd!)")
            request.httpBody = "account=\(uid!)&password=\(pwd!)" .data(using: .utf8)
            request.httpMethod = "POST"
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
                
                if let data = data {
                    let html = String(data:data, encoding: .utf8)
                  
                    if html == "0" {
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "vc_to_welcome", sender: self)
                        }
                    }else{
                        let alert = UIAlertController(title: "Error", message: "Account or password is wrong", preferredStyle: .alert)
                        let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alert.addAction(OK)
                        self.present(alert,animated: true,completion: nil)
                        //                        DispatchQueue.main.async {
                        //                            self.errorMessage.alpha = 1
                        //                            self.errorMessage.textColor = .red
                        //                        }
                    }
                }
            })
            dataTask.resume()
            print("this is ok")
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        alert.addTextField { (textField) in
            textField.placeholder = "account"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "password"
            textField.isSecureTextEntry = true
        }
        present(alert,animated: true,completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        errorMessage.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

