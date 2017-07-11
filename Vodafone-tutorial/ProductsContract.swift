//
//  ProductsContract.swift
//  Vodafone-tutorial
//
//  Created by marko nazmy on 7/11/17.
//  Copyright © 2017 marko nazmy. All rights reserved.
//

import Foundation

protocol ProductsViewProtocol{
    func showProducts(products : [Product])
}

protocol ProductsPresenterProtocol {
    func getUserProducts()
    func showSubtitleInRow() -> Bool
    func showProducts(products : [Product])
}

protocol ProductsRetriverProtocol {
    func getUserProducts()
}
