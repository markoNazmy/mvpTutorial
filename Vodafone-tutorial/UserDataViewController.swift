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
        self.navigationItem.title="Profile"
        presenterRef = UserPersonalDataPresenter(viewRef: self)
        presenterRef?.getUserData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func navigateToUserProducts(_ sender: Any) {
        
    }

    func navigateToProducts() {
        let productsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
        self.navigationController?.pushViewController(productsViewController, animated: true)
    }
    
    func viewUserDataWithUserType(userData : UserData){
        userName.text = userData.surName
        userType.text = userData.userType
    }

    func hideUserType(){
        self.userType.isHidden = true
        self.userTypeLabel.isHidden = true
    }
        
    @IBAction func getProducts(_ sender: Any) {
        navigateToProducts()
    }
}
