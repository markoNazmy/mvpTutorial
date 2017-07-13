//
//  UserPersonalDataRetriver.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/9/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import ObjectMapper

class UserPersonalDataRetriver: BaseRetriver, UserPersonalDataRetriverProtocol , DataRetriverProtocol{
    
    var presenterRef : UserPersonalDataPresenterProtocol
    
    init(presenterRef : UserPersonalDataPresenterProtocol) {
        self.presenterRef = presenterRef
    }
        
    func onSuccess(json: [String : Any]) {
        
    }
    
    func onError(error: VFError) {

    }
    
    func getUserDataForPresenter() {
        presenterRef.showUserData(userData: getUserData())
    }
}
