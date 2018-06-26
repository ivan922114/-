//
//  habitsTextCell.swift
//  暨大校園植物誌
//
//  Created by viplab on 2018/6/22.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit

class habitsTextCell: UITableViewCell {
    
    @IBOutlet var habitsLabel: UILabel!{
        didSet{
            habitsLabel.numberOfLines = 0
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
