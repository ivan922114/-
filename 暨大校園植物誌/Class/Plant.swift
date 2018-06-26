//
//  Plant.swift
//  暨大校園植物誌
//
//  Created by viplab on 2018/5/29.
//  Copyright © 2018年 viplab. All rights reserved.
//

import Foundation

class Plant {
    var Name: String                //中文名
    var Scientificname: String      //學名
    var Sectionname: String         //科名
    var distributed: String         //分布
    var habits: String         //生態習性
    var image: String
    
    init(Name:String, Scientificname: String, Sectionname: String, distributed: String, habits: String, image: String) {
        
        self.Name = Name
        self.Scientificname = Scientificname
        self.Sectionname = Sectionname
        self.distributed = distributed
        self.habits = habits
        self.image = image
    }
    
    convenience init() {
        self.init(Name: "", Scientificname: "", Sectionname: "", distributed: "", habits: "", image: "")
    }
}
