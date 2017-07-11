//
//  SplashScreenPresenter.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/10/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation


class SplashScreenPresenter : BasePresenter ,SplashScreenPresenterProtocol  {
    
    var viewRef : SplashScreenViewProtocol
    var retriverRef : SplashScreenRetriverProtocol?
    
    init(viewRef : SplashScreenViewProtocol) {
        self.viewRef = viewRef
        super.init(baseViewController: viewRef as! BaseViewController)
        
        
    }
    
    func login(msdn : String , password : String) {
        retriverRef = setRetriver()
        if !msdn.isEmpty && !password.isEmpty{
            retriverRef!.login(msdn: msdn, password: password)
            
        }
        else {
            showMessage(error: VFError(errorCode: VFErrorCode.emptyFields.rawValue , errorMessage: "username OR password munt not be empty !"))
        }
    }
    
    func navigateToUserData(userData : UserData){
        viewRef.navigateToUserData(userData: userData)
    }
    func setRetriver() -> SplashScreenRetriverProtocol {
        return SplashScreenRetriver(presenterRef: self)
    }
}
