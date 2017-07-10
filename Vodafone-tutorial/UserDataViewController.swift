//
//  UserDataViewController.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/8/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import UIKit

class UserDataViewController : BaseViewController , UserPersonalDataViewProtocol {
    
    
    
    var presenterRef : UserPersonalDataPresenterProtocol?

    @IBOutlet weak var userType: UILabel!
    @IBOutlet weak var userTypeLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    var userData : UserData?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterRef = UserPersonalDataPresenter(viewRef: self)
        userName.text = userData?.surName
        if userData?.userType == "postpaid" {
            userType.text = userData?.userType
        }
        else{
            userType.isHidden = true
            userTypeLabel.isHidden = true
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func navigateToUserProducts(_ sender: Any) {
    }
    func setUserData(userData : UserData) {
        self.userData = userData
    }
    
    func navigateToProducts(products: [Product]) {
       print(products.toJSON())
        
        let productsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
        productsViewController.setProducts(products: products, userData: userData!)
        self.navigationController?.pushViewController(productsViewController, animated: true)
        
    }
    func showUiError(error: VFError) {
        let alert = UIAlertController(title: "Alert", message: error.errorMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func getProducts(_ sender: Any) {
        presenterRef?.getUserProducts(token: (userData?.token)!)
    }
}
