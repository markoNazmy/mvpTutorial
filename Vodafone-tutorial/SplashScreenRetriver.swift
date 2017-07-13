//
//  SplashScreenRetriver.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/10/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import ObjectMapper

class SplashScreenRetriver : SplashScreenRetriverProtocol , DataRetriverProtocol{
    
    
    var presenterRef : SplashScreenPresenterProtocol
    var url : String = "http://mvp-poc.getsandbox.com/authenticate?"
    
    init(presenterRef : SplashScreenPresenterProtocol) {
        self.presenterRef = presenterRef
    }
    
    func login() {
        
        let userDefaults = UserDefaults.standard
        if((userDefaults.string(forKey: "userName")) != nil && (userDefaults.string(forKey: "password")) != nil){
            url.append("msisdn=")
            url.append((userDefaults.string(forKey: "userName"))!)
            url.append("&")
            url.append("password=")
            url.append((userDefaults.string(forKey: "password"))!)
            NetworkLayer.getDataFromServer(retriverRef: self, url: url)
        }
        else {
            (self.presenterRef as! BasePresenter).showLoginPage()
        }
    }
    
    func onSuccess(json: [String : Any]) {
        let userData : UserData =  Mapper<UserData>().map(JSON: json)!
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject : userData.self)
        userDefaults.set(encodedData, forKey: "userData")
        userDefaults.synchronize()
        presenterRef.navigateToUserData()
    }
    
    func onError(error: VFError) {
        (presenterRef as! BasePresenter).showMessage(error: error , blockOfCod: { _ in
            (self.presenterRef as! BasePresenter).showLoginPage()
        })
    }
}

