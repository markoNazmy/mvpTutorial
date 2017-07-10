//
//  AuthenticationContract.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/8/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation

protocol LoginViewProtocol {
    func showUiError(error : VFError)
    func navigateToUserData(userData : UserData)

}
protocol LoginPresenterProtocol {
    func login(msdn : String , password : String)
    func showUiError(error : VFError)
    func showBackendError(error : VFError)
    func navigateToUserData(userData : UserData)

}

protocol LoginRetriverProtocol {
    func login(msdn : String , password : String)
}
