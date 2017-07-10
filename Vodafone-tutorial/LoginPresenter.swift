//
//  LoginPresenter.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/8/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation

class LoginPresenter: BasePresenter, LoginPresenterProtocol{
    
    var viewRef : LoginViewProtocol
    var retriverRef : LoginRetriverProtocol?
    init(viewRef : LoginViewProtocol) {
        self.viewRef = viewRef
        super.init(baseViewController: viewRef as! BaseViewController)

        
    }
    
    func login(msdn : String , password : String) {
        retriverRef = setRetriver()
        if !msdn.isEmpty && !password.isEmpty{
        retriverRef!.login(msdn: msdn, password: password)
        }
        else {
            showUiError(error: VFError(errorCode: VFErrorCode.emptyFields.rawValue , errorMessage: "username OR password munt not be empty !"))
        }
    }
    func showUiError(error : VFError){
        viewRef.showUiError(error: error)
    }
    func showBackendError(error : VFError){
        viewRef.showUiError(error: error)
    }
    func navigateToUserData(userData : UserData){
        viewRef.navigateToUserData(userData: userData)
    }
    func setRetriver() -> LoginRetriverProtocol {
        return LoginDataRetriver(presenterRef: self)
    }
    
}
