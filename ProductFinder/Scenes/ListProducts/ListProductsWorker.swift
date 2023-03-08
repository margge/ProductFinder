//
//  ListProductsWorker.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit

protocol ListProductsWorkerProtocol {
    func getProductsByCategory(completitionHandler: @escaping (ProductData) -> Void,
                               completitionFailure: @escaping (_ error: Error?) -> ())
    func getProductsBySearch(query: String,
                             completitionHandler: @escaping (ProductData) -> Void,
                             completitionFailure: @escaping () -> ())
}

class ListProductsWorker: ListProductsWorkerProtocol {
    
    func getProductsByCategory(completitionHandler: @escaping (ProductData) -> Void,
                               completitionFailure: @escaping (_ error: Error?) -> ()) {
        
        NetworkProvider.shared.getProductsByCategory { products in
            completitionHandler(products)
        } failure: { error in
            print("[\(ListProductsWorker.self)] - getProductsByCategory: \(String(describing: error))")
            completitionFailure(error)
        }
    }
    
    func getProductsBySearch(query: String,
                             completitionHandler: @escaping (ProductData) -> Void,
                             completitionFailure: @escaping () -> ()) {
        
        NetworkProvider.shared.getProductsBySearch(searchQuery: query) { products in
            completitionHandler(products)
        } failure: { error in
            print("[\(ListProductsWorker.self)] - getProductsBySearch: \(String(describing: error))")
            completitionFailure()
        }
    }
}
