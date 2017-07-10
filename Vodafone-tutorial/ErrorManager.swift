//
//  ErrorManager.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/9/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation

class ErrorManager {
    
    public static func fetchError(dataRetriverProtocol : DataRetriverProtocol , errorCode : Int) {
        
        switch errorCode {
        case VFErrorCode.requestedDataNotFound.rawValue : dataRetriverProtocol.onError(error: VFError(errorCode: VFErrorCode.requestedDataNotFound.rawValue , errorMessage: "not found in server !"))
            
        case VFErrorCode.requestFaild.rawValue : dataRetriverProtocol.onError(error: VFError(errorCode: VFErrorCode.requestedDataNotFound.rawValue , errorMessage: "server error try again later !"))
            
        default: dataRetriverProtocol.onError(error: VFError(errorCode: VFErrorCode.dummyError.rawValue , errorMessage: "unKnown error !"))
            
        }
    }

    
}
