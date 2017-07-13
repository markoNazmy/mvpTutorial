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
            
        case VFErrorCode.unAuthourized.rawValue : dataRetriverProtocol.onError(error: VFError(errorCode: VFErrorCode.unAuthourized.rawValue , errorMessage: "unAuthourized access !"))
            
        case VFErrorCode.requestFaild.rawValue : dataRetriverProtocol.onError(error: VFError(errorCode: VFErrorCode.requestFaild.rawValue , errorMessage: "server error try again later !"))
            
        case VFErrorCode.dataNotFound.rawValue : dataRetriverProtocol.onError(error: VFError(errorCode: VFErrorCode.dataNotFound.rawValue , errorMessage: "data not found !"))
            
        default: dataRetriverProtocol.onError(error: VFError(errorCode: VFErrorCode.dummyError.rawValue , errorMessage: "unKnown error !"))
            
        }
    }

    
}
