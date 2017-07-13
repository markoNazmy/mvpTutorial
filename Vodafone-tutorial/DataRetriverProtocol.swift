//
//  DataRetriverProtocol.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/8/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation

protocol DataRetriverProtocol {
    
    func onSuccess(json : [String: Any])
    
    func onError(error : VFError)
}
