//
//  ListProductsRouter.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit

@objc protocol ListProductsRoutingLogic {
    func routeToProductDetail(with productId: String)
}

protocol ListProductsDataPassing {
    var dataStore: ListProductsDataStore? { get }
}

class ListProductsRouter: NSObject, ListProductsRoutingLogic, ListProductsDataPassing {
    
    weak var viewController: ListProductsViewController?
    var dataStore: ListProductsDataStore?
    
    // MARK: Routing
    
    func routeToProductDetail(with productId: String) {
    }
    
    // MARK: Navigation
    
    func navigateToSomewhere(source: ListProductsViewController, destination: ProductDetailViewController) {
    }
}
