//
//  BasePresenter.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/9/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation

class BasePresenter{
    var baseViewController : BaseViewController
    
    init(baseViewController : BaseViewController) {
        self.baseViewController = baseViewController
    }
    
    func showLoginPage() {
        baseViewController.showLoginPage()
    }
}
