//
//  ProductsPresenter.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/11/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import UIKit

class ProductsPresenter: BasePresenter , ProductsPresenterProtocol {
    
    var viewRef : ProductsViewProtocol
    var retriverRef : ProductsRetriverProtocol?
    var postpaid = "postpaid"
    init(viewRef : ProductsViewProtocol) {
        self.viewRef = viewRef
        super.init(baseViewController: viewRef as! BaseViewController)
        
    }
    
    func getUserProducts(){
        retriverRef = self.setRetriver()
        (viewRef as! BaseViewController).startActivityIndicatorAnimating()
        
        retriverRef?.getUserProducts()
    }
    func showProducts(products : [Product]){
        (viewRef as! BaseViewController).stopActivityIndicatorAnimating()
        viewRef.showProducts(products: products)
    }
    
    func setRetriver() -> ProductsRetriverProtocol{
        return ProductsRetriver(presenterRef: self)
    }
    
    func showSubtitleInRow(label : UILabel) {
        if (retriverRef as! BaseRetriver).getUserData().userType != postpaid{
            label.isHidden = true
        }
    }
    
    
}
