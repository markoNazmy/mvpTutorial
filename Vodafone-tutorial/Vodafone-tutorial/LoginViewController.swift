//
//  ViewController.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/6/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController , LoginViewProtocol {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    var presenterRef : LoginPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterRef = LoginPresenter(viewRef: self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showUiError(error: VFError) {
        let alert = UIAlertController(title: "Alert", message: error.errorMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func navigateToUserData(userData: UserData) {
        print(userData.self.givenName)
        
//        let userDataNavigationController = self.storyboard?.instantiateViewController(withIdentifier: "navigationcont") as! UINavigationController
//        let userDataViewController = userDataNavigationController.viewControllers[0] as! UserDataViewController
//        userDataViewController.setUserData(userData: userData)
//        self.present(userDataViewController, animated: true, completion: nil)

        
        
        
        
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "UserDataViewController") as! UserDataViewController
        let navController = UINavigationController(rootViewController: VC1)
        VC1.setUserData(userData: userData)

        self.present(navController, animated:true, completion: nil)
        
    }
    @IBAction func login(_ sender: Any) {
        presenterRef.login(msdn: userName.text!, password: password.text!)
    }
}

