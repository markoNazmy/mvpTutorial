//
//  UserPersonalDataPresenter.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/9/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation

class UserPersonalDataPresenter: BasePresenter , UserPersonalDataPresenterProtocol {
    
    var viewRef : UserPersonalDataViewProtocol
    var retriverRef : UserPersonalDataRetriverProtocol?
    
    init(viewRef : UserPersonalDataViewProtocol) {
        self.viewRef = viewRef
        super.init(baseViewController: viewRef as! BaseViewController)

    }
    

    func getUserData() {
        retriverRef = setRetriver()
        retriverRef?.getUserDataForPresenter()
    }
    func setRetriver() -> UserPersonalDataRetriverProtocol {
        return UserPersonalDataRetriver(presenterRef: self)
    }
    
    func showUserData(userData: UserData) {
        
        if userData.userType == "postpaid" {
            viewRef.viewUserDataWithUserType(userData: (retriverRef as! BaseRetriver).getUserData())
        }
        else{
            viewRef.viewUserDataWithUserType(userData: (retriverRef as! BaseRetriver).getUserData())
            viewRef.hideUserType()
        }
    }
  
}
