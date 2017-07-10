//
//  UserPersonalDataRetriver.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/9/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import ObjectMapper

class UserPersonalDataRetriver: UserPersonalDataRetriverProtocol , DataRetriverProtocol{
    
    var presenterRef : UserPersonalDataPresenterProtocol
    var url : String = "http://mvp-poc.getsandbox.com/products?"
    init(presenterRef : UserPersonalDataPresenterProtocol) {
        self.presenterRef = presenterRef
    }
    
    func getUserProducts(token: String) {
        url.append("token=")
        url.append(token)
        NetworkLayer.getDataFromServer(retriverRef: self, url: url)
    }
    
    func onSuccess(json: [String : Any]) {
        let itemsArr = json["items"] as! [[String: Any]]
        let Products : [Product] = Mapper<Product>().mapArray(JSONArray: itemsArr)
        presenterRef.navigateToProducts(products: Products)

    }
    
    func onError(error: VFError) {
        presenterRef.showUiError(error: error)
    }
}
