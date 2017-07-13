//
//  SplashScreenViewController.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/10/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import UIKit

class SplashScreenViewController : BaseViewController , SplashScreenViewProtocol{
    
    @IBOutlet weak var splashGifImage: UIImageView!
    var presenterRef : SplashScreenPresenterProtocol!
    
    override func viewWillAppear(_ animated: Bool) {
        splashGifImage.image = UIImage.gifImageWithName("vodafone")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenterRef.login()
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterRef = SplashScreenPresenter(viewRef: self)

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func navigateToUserData() {
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "UserDataViewController") as! UserDataViewController
        let navController = UINavigationController(rootViewController: VC1)
        self.present(navController, animated:true, completion: nil)
    }
    
}

