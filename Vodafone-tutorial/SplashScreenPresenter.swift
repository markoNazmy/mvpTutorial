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
    
    func login() {
        retriverRef = setRetriver()
        retriverRef!.login()

    }
    
    func navigateToUserData(){
        viewRef.navigateToUserData()
    }
    
    func setRetriver() -> SplashScreenRetriverProtocol {
        return SplashScreenRetriver(presenterRef: self)
    }
}
