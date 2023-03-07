//
//  ProductDetailRouter.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit

@objc protocol ProductDetailRoutingLogic {
}

protocol ProductDetailDataPassing {
    var dataStore: ProductDetailDataStore? { get }
}

class ProductDetailRouter: NSObject, ProductDetailRoutingLogic, ProductDetailDataPassing {
    weak var viewController: ProductDetailViewController?
    var dataStore: ProductDetailDataStore?
}
