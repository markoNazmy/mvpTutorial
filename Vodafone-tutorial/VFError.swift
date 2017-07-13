//
//  VFError.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/9/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation

class VFError {
    
    var errorCode : Int
    var errorMessage : String
    
    init(errorCode : Int , errorMessage : String) {
        self.errorCode = errorCode
        self.errorMessage = errorMessage
    }
}

enum VFErrorCode : Int{
    case unAuthourized = 401
    case requestFaild = 503
    case dataNotFound = 404
    case dummyError = 000
    case emptyFields = 76324836
}
