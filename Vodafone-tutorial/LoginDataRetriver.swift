//
//  LoginDataRetriver.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/8/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import ObjectMapper


class LoginDataRetriver : LoginRetriverProtocol , DataRetriverProtocol{

    var presenterRef : LoginPresenterProtocol
    var url : String = "http://mvp-poc.getsandbox.com/authenticate?"
    var userName : String?
    var password : String?
    init(presenterRef : LoginPresenterProtocol) {
        self.presenterRef = presenterRef
    }
    func login(msdn: String, password: String) {
        url.append("msisdn=")
        url.append(msdn)
        url.append("&")
        url.append("password=")
        url.append(password)
        self.userName = msdn
        self.password = password
        NetworkLayer.getDataFromServer(retriverRef: self, url: url)
    }
    
    func onSuccess(json: [String : Any]) {
        let userData : UserData =  Mapper<UserData>().map(JSON: json)!
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject : userData.self)
        userDefaults.set(encodedData, forKey: "userData")
        userDefaults.set(userName, forKey: "userName")
        userDefaults.set(password, forKey: "password")
        userDefaults.synchronize()
        presenterRef.navigateToUserData(userData: userData)
    }
    
    func onError(error: VFError) {
        (presenterRef as! BasePresenter).showMessage(error: error)
    }
}
