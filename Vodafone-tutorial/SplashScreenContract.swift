//
//  SplashScreenContract.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/10/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation


protocol SplashScreenViewProtocol {
    func navigateToUserData(userData : UserData)
}

protocol SplashScreenPresenterProtocol {
    func login(msdn : String , password : String)
    func navigateToUserData(userData : UserData)
}

protocol SplashScreenRetriverProtocol {
    func login(msdn : String , password : String)
}


