//
//  ViewController.swift
//  2018.06.01_3
//
//  Created by admin on 2018/6/1.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let imageList = ["drink_1.jpg", "drink_2.jpeg", "drink_3.jpeg", "drink_4.jpeg", "drink_5.jpeg", "drink_6.jpeg", "drink_7.jpeg", "drink_8.jpeg", "drink_9.jpeg", "drink_10.jpeg"]
//    let textList = ["drink_1.jpg", "drink_2.jpeg", "drink_3.jpeg", "drink_4.jpeg", "drink_5.jpeg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return (imageList.count % 2 == 0) ? (imageList.count / 2) + 1 : ((imageList.count - 1) / 2) + 1
//       return lround(Double(imageList.count))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        tableView.rowHeight = UITableViewAutomaticDimension
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCell
        
        
        if indexPath.row == 0 {
            cell.imageViewLeft.image = resizeImage(UIImage(named: imageList[0])!)
            cell.lableLeft.text = imageList[0]
            cell.lableLeft.textColor = .white
            if let imageRight = cell.imageViewRight{
//                imageRight.superview?.removeFromSuperview()
                imageRight.superview?.isHidden = true
            }
        }else {
            cell.imageViewLeft.image = resizeImage(UIImage(named: imageList[indexPath.row * 2 - 1])!)
            cell.lableLeft.text = imageList[indexPath.row * 2 - 1]
            cell.lableLeft.textColor = .white
            cell.lableRight.textColor = .white
            cell.imageViewRight.superview?.isHidden = false
            if indexPath.row * 2 < imageList.count {
                cell.imageViewRight.image = resizeImage(UIImage(named: imageList[indexPath.row * 2])!)
                cell.lableRight.text = imageList[indexPath.row * 2]
                
            }else {
                cell.imageViewRight.image = nil
                cell.lableRight.text = nil
            }
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UIScreen.main.bounds.size.width
        }
        return UITableViewAutomaticDimension
    }
    
    func resizeImage(_ image: UIImage) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 300, height: 300))
        image.draw(in: CGRect(x: 0, y: 0, width: 300, height: 300))
        let tmp = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tmp!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

