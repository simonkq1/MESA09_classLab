//
//  MyCell.swift
//  2018.06.01_3
//
//  Created by admin on 2018/6/1.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

//    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var viewLeft: UIView!
    @IBOutlet weak var imageViewLeft: UIImageView!
    @IBOutlet weak var lableLeft: UILabel!
    @IBOutlet weak var viewRight: UIView!
    @IBOutlet weak var imageViewRight: UIImageView!
    @IBOutlet weak var lableRight: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
