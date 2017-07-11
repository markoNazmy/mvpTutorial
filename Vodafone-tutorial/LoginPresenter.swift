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
            (viewRef as! BaseViewController).startActivityIndicatorAnimating()
            retriverRef!.login(msdn: msdn, password: password)
            
        }
        else {
            showMessage(error: VFError(errorCode: VFErrorCode.emptyFields.rawValue , errorMessage: "username OR password munt not be empty !"))
        }
    }
    
    func navigateToUserData(userData : UserData){
        (viewRef as! BaseViewController).stopActivityIndicatorAnimating()
        viewRef.navigateToUserData(userData: userData)
    }
    func setRetriver() -> LoginRetriverProtocol {
        return LoginDataRetriver(presenterRef: self)
    }
    
}
