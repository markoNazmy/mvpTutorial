//
//  BaseRetriver.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/11/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation

class BaseRetriver {
    
    func getUserData()->UserData{
        let userDefaults = UserDefaults.standard
        let userData = (userDefaults.object(forKey: "userData") as! Data)
        if  !userData.isEmpty{
            let u = NSKeyedUnarchiver.unarchiveObject(with: userData) as! UserData
            return u
        }
        return UserData(version: "", givenName: "", surName: "", userType: "", token: "")
    }
    
}
