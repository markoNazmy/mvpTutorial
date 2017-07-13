//
//  BasePresenter.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/9/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import UIKit

class BasePresenter{
    var baseViewController : BaseViewController
    
    init(baseViewController : BaseViewController) {
        self.baseViewController = baseViewController
    }
    
    func showLoginPage() {
        baseViewController.showLoginPage()
    }
    
    func showMessage(error : VFError , blockOfCod :  ((_ : UIAlertAction)->Void)? = nil ) {
        baseViewController.showError(error: error , okBlockOfCode: blockOfCod)
    }
}
