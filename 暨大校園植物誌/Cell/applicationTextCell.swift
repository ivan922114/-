//
//  applicationTextCell.swift
//  暨大校園植物誌
//
//  Created by viplab on 2018/5/31.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit

class applicationTextCell: UITableViewCell {

    @IBOutlet var applicationLabel: UILabel!{
        didSet{
            applicationLabel.numberOfLines = 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
