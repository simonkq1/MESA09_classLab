//
//  ViewController.swift
//  2018.06.05_1
//
//  Created by admin on 2018/6/5.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate, WKUIDelegate {
    
    
    
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var forwardBtn: UIBarButtonItem!
    @IBOutlet weak var urlText: UITextField!
    @IBOutlet weak var webKitView: WKWebView!
    @IBAction func connectBtn(_ sender: Any) {
        checkAndConnectUrl()
        urlText.resignFirstResponder()
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        webKitView.goBack()
    }
    
    @IBAction func goForward(_ sender: Any) {
        webKitView.goForward()
    }
    
    @IBAction func reload(_ sender: Any) {
        webKitView.reload()
    }
    
    @IBAction func goHome(_ sender: Any) {
        let url = URL(string: "localhost/alertTest.html")
        let request = URLRequest(url: url!)
        webKitView.load(request)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        backBtn.isEnabled = webKitView.canGoBack
        forwardBtn.isEnabled = webKitView.canGoForward
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        print("Hi")
//        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(okBtn)
//        present(alert,animated: true,completion: nil)
        errorAlert("", message)
        completionHandler()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let url = URL(string: "https://www.apple.com")
        let url = URL(string: "http://localhost/alertTest.html")
        
        let request = URLRequest(url: url!)
        webKitView.load(request)
        urlText.delegate = self
        webKitView.uiDelegate = self
        webKitView.navigationDelegate = self
        
        print(DataArea.domain.count)
        let str = "111.211.113.114"
        let arr = str.split(separator: ".")
        print(arr)
        print(arr[0].count)
        if Int(arr[0]) != nil {
            print("OK")
        }
        
        let pattern = "^\\d{1,4}.\\d{1,4}.\\d{1,4}.\\d{1,4}$"
        
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let match = regex.matches(in: str, options: [], range: NSRange(location: 0, length: str.count))
        
        print("AAA + \(match.count)")
        
    }
    
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        urlText.resignFirstResponder()
    //    }
    
    func checkAndConnectUrl() {
        var url: URL!
        let text = urlText.text?.lowercased()
        
        let pattern = "^\\d{1,3}.\\d{1,3}.\\d{1,3}.\\d{1,3}$"
        
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let match = regex.matches(in: urlText.text!, options: [], range: NSRange(location: 0, length: urlText.text!.count))
        
        //        print("AAA + \(match.count)")
        //        print(match)
        
        if urlText.text != "" {
            if urlText.text?.lowercased() == "localhost" {
                url = URL(string: urlText.text!)
                
            }else {
                if match.count == 1 {
                    let strArr = urlText.text?.split(separator: ".")
                    if Int(strArr![0])! >= 0, Int(strArr![0])! <= 255,Int(strArr![1])! >= 0, Int(strArr![1])! <= 255,Int(strArr![2])! >= 0, Int(strArr![2])! <= 255,Int(strArr![3])! >= 0, Int(strArr![3])! <= 255 {
                        url = URL(string: urlText.text!)
                        let request = URLRequest(url: url!)
                        webKitView.load(request)
                        
                    }else {
                        url = URL(string: "https://www.google.com.tw/search?q=" + urlText.text!)
                    }
                }else {
                    if urlText.text?.contains("https://") == true || urlText.text?.contains("http://") == true{
                        url = URL(string: (urlText.text?.lowercased())!)
                        urlText.text = text
                    }else{
                        for i in DataArea.domain {
                            if urlText.text?.lowercased().contains(i) == true{
                                if (urlText.text?.lowercased().hasPrefix(i))! {
                                    url = URL(string: "https://www.google.com.tw/search?q=" + urlText.text!)
                                    break
                                }else if urlText.text?.lowercased().hasSuffix(i) == true{
                                    url = URL(string: "https://" + (urlText.text?.lowercased())!)
                                    urlText.text = text
                                    break
                                    
                                }else {
                                    
                                    url = URL(string: "https://www.google.com.tw/search?q=" + urlText.text!)
                                    break
                                }
                            }else {
                                url = URL(string: "https://www.google.com.tw/search?q=" + urlText.text!)
                            }
                        }
                    }
                    
                }
            }
            
            
            
            if url != nil {
                let request = URLRequest(url: url!)
                print(request)
                webKitView.load(request)
                
            }else {
                url = URL(string: "https://www.google.com.tw/search?q=" + urlText.text!)
            }
        }else{
            errorAlert("error", "Please enter url")
        }
    }
    
    
    
    func errorAlert(_ title: String, _ msg: String) {
        let alert: UIAlertController
            alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okBtn)
        self.present(alert,animated: true,completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        urlText.resignFirstResponder()
        checkAndConnectUrl()
        return true
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
//                let url = URL(string: "https://www.google.com.tw/search?q=\(urlText.text)")
//        let url = URL(string: urlText.text!)
//
//        let request = URLRequest(url: url!)
//        webKitView.load(request)
        errorAlert("error", "Wrong URL")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

