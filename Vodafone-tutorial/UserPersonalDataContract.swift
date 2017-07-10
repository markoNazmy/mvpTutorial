//
//  UserPersonalDataContract.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/9/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation

protocol UserPersonalDataViewProtocol {
    func navigateToProducts(products : [Product])
    func showUiError(error : VFError)
}

protocol UserPersonalDataPresenterProtocol {
    func getUserProducts(token : String)
    func navigateToProducts(products : [Product])
    func showUiError(error : VFError)
}

protocol UserPersonalDataRetriverProtocol {
    func getUserProducts(token : String)
}
