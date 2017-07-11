//
//  UserPersonalDataContract.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/9/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation

protocol UserPersonalDataViewProtocol {
    func viewUserDataWithUserType(userData : UserData)
    func hideUserType()

}

protocol UserPersonalDataPresenterProtocol {
    func getUserData()
    func showUserData(userData : UserData)
}

protocol UserPersonalDataRetriverProtocol {
    func getUserDataForPresenter()
}
