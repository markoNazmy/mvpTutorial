//
//  ProductsRetriver.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/11/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductsRetriver : BaseRetriver, DataRetriverProtocol , ProductsRetriverProtocol{
    
    var presenterRef : ProductsPresenterProtocol
    var url : String = "http://mvp-poc.getsandbox.com/products?"
    
    init(presenterRef : ProductsPresenterProtocol) {
        self.presenterRef = presenterRef
    }
    
    func getUserProducts(){
        url.append("token=")
        url.append(getUserData().token)
        NetworkLayer.getDataFromServer(retriverRef: self, url: url)
    }
    
    func onSuccess(json: [String : Any]) {
        let itemsArr = json["items"] as! [[String: Any]]
        let Products : [Product] = Mapper<Product>().mapArray(JSONArray: itemsArr)
        presenterRef.showProducts(products: Products)
        
    }
    
    func onError(error: VFError) {
        if error.errorCode == VFErrorCode.unAuthourized.rawValue {
            let userDefaults = UserDefaults.standard
            userDefaults.removeObject(forKey: "userName")
            userDefaults.removeObject(forKey: "password")
            userDefaults.removeObject(forKey: "userData")
            
            (presenterRef as! BasePresenter).showMessage(error: error , blockOfCod: { _ in
                (self.presenterRef as! BasePresenter).showLoginPage()})
        }
        else{
            (presenterRef as! BasePresenter).showMessage(error: error)
        }
    }
    
}
