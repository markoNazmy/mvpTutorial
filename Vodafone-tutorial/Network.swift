//
//  Network.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/8/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation
import Alamofire

class NetworkLayer {
    
    public static func getDataFromServer(retriverRef : DataRetriverProtocol , url : String) {
        print(url)
        Alamofire.request(url, method: .get)
            .validate()
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success:
                    retriverRef.onSuccess(json: response.result.value! as! [String : Any])
                case .failure:
                    if let response = response.response {
                        ErrorManager.fetchError(dataRetriverProtocol: retriverRef, errorCode: response.statusCode)
                    }
                }
            }
        )
    }
   
}
