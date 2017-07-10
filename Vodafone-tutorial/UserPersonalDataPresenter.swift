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
    
    func getUserProducts(token: String) {
        retriverRef = self.setRetriver()
        retriverRef?.getUserProducts(token: token)
    }
    
    func navigateToProducts(products: [Product]) {
        viewRef.navigateToProducts(products: products)
    }
    func setRetriver() -> UserPersonalDataRetriverProtocol {
        return UserPersonalDataRetriver(presenterRef: self)
    }
    
    func showUiError(error: VFError) {
        viewRef.showUiError(error: error)
    }
}
