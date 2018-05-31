//
//  PlantCell.swift
//  暨大校園植物誌
//
//  Created by viplab on 2018/5/1.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit

class PlantCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
