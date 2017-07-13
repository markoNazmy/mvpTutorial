//
//  BaseViewController.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/9/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController {
    var window: UIWindow?
    var indicator : UIActivityIndicatorView?
    
    func startActivityIndicatorAnimating() {
        indicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        indicator?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        indicator?.center = self.view.center
        indicator?.layer.cornerRadius = 05
        indicator?.clipsToBounds = true
        indicator?.isOpaque = false
        indicator?.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
        
        self.view.addSubview(indicator!)
        self.indicator?.startAnimating()
        self.window?.isUserInteractionEnabled = false
    }
    
    func stopActivityIndicatorAnimating() {
        self.indicator?.stopAnimating()
        self.window?.isUserInteractionEnabled = true
    }
    
    func showError(error : VFError , okBlockOfCode : ((_ : UIAlertAction)->Void)? = nil) {
        if let u = self.indicator{
            u.stopAnimating()
        }
        let alert = UIAlertController(title: "Alert", message: error.errorMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler : okBlockOfCode))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoginPage() {
        
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(loginViewController, animated: true, completion: nil)
//        if self.navigationController != nil{
//            self.navigationController?.popToRootViewController(animated: true)
//        }
        
    }
}
