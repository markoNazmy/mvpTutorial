//
//  Product.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/8/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import ObjectMapper

class Product : Mappable{

     var url : String
     var icon : String
     var label : String
     var subtitle : String

    init(url : String ,icon : String ,label : String ,subtitle : String) {
        self.url = url
        self.icon = icon
        self.label = label
        self.subtitle = subtitle
    }
    
    required init?(map: Map) {
        self.url = ""
        self.icon = ""
        self.label = ""
        self.subtitle = ""
    }
    
    
    
    func mapping(map: Map) {
        url    <- map["url"]
        icon   <- map["icon"]
        label      <- map["label"]
        subtitle       <- map["subtitle"]
        
    }
    
}

