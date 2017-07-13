//
//  SplashScreenContract.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/10/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation


protocol SplashScreenViewProtocol {
    func navigateToUserData()
}

protocol SplashScreenPresenterProtocol {
    func login()
    func navigateToUserData()
}

protocol SplashScreenRetriverProtocol {
    func login()
}


