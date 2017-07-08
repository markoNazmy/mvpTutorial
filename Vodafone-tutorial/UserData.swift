//
//  UserData.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/8/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation

class UserData : NSObject , NSCoding {
 
    var version : String
    var givenName :String
    var surName : String;
    var userType : String;
    var token : String;
    
    init(version : String , givenName : String ,surName :String ,userType :String ,token :String) {
        self.version = version
        self.givenName = givenName
        self.surName = surName
        self.userType = userType
        self.token = token
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let version = aDecoder.decodeObject(forKey: "version") as! String
        let givenName = aDecoder.decodeObject(forKey: "givenName") as! String
        let surName = aDecoder.decodeObject(forKey: "surName") as! String
        let userType = aDecoder.decodeObject(forKey: "userType") as! String
        let token = aDecoder.decodeObject(forKey: "token") as! String

        self.init(
            version: version ,
            givenName: givenName ,
            surName : surName ,
            userType : userType,
            token : token
        )
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(version, forKey: "version")
        aCoder.encode(givenName, forKey: "givenName")
        aCoder.encode(surName, forKey: "surName")
        aCoder.encode(userType, forKey: "userType")
        aCoder.encode(token, forKey: "token")

        
    }

}
