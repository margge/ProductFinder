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
        let storyboard = UIStoryboard(name: Constants.kProductDetailStoryboard, bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: Constants.kProductDetailViewController) as! ProductDetailViewController
        destinationVC.productId = productId
        navigateToSomewhere(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
    
    func navigateToSomewhere(source: ListProductsViewController, destination: ProductDetailViewController) {
        source.show(destination, sender: nil)
    }
}
