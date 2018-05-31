//
//  Plant.swift
//  暨大校園植物誌
//
//  Created by viplab on 2018/5/29.
//  Copyright © 2018年 viplab. All rights reserved.
//

import Foundation

class Plant {
    var Name: String
    var Englishname: String
    var Scientificname: String
    var Sectionname: String
    var Alias: String
    var Origin: String
    var distributed: String
    var application: String
    var image: String
    
    init(Name:String, Englishname: String, Scientificname: String, Sectionname: String, Alias: String, Origin: String, distributed: String, application: String, image: String) {
        
        self.Name = Name
        self.Englishname = Englishname
        self.Scientificname = Scientificname
        self.Sectionname = Sectionname
        self.Alias = Alias
        self.Origin = Origin
        self.distributed = distributed
        self.application = application
        self.image = image
    }
    
    convenience init() {
        self.init(Name: "", Englishname: "", Scientificname: "", Sectionname: "", Alias: "", Origin: "", distributed: "", application: "", image: "")
    }
}
