//
//  ListProductsWorker.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit

protocol ListProductsWorkerProtocol {
    func getProductsByCategory(completitionHandler: @escaping (ProductData) -> Void,
                               completitionFailure: @escaping (_ error: Error?) -> Void)
    func getProductsBySearch(query: String,
                             completitionHandler: @escaping (ProductData) -> Void,
                             completitionFailure: @escaping () -> Void)
}

class ListProductsWorker: ListProductsWorkerProtocol {
    
    private let networkProvider: NetworkProviderProtocol
    
    init(networkProvider: NetworkProviderProtocol = NetworkProvider.shared) {
        self.networkProvider = networkProvider
    }
    
    func getProductsByCategory(completitionHandler: @escaping (ProductData) -> Void,
                               completitionFailure: @escaping (_ error: Error?) -> Void) {
        
        networkProvider.getProductsByCategory { products in
            completitionHandler(products)
        } failure: { error in
            print("[\(ListProductsWorker.self)] - getProductsByCategory: \(String(describing: error))")
            completitionFailure(error)
        }
    }
    
    func getProductsBySearch(query: String,
                             completitionHandler: @escaping (ProductData) -> Void,
                             completitionFailure: @escaping () -> Void) {
        
        networkProvider.getProductsBySearch(searchQuery: query) { products in
            completitionHandler(products)
        } failure: { error in
            print("[\(ListProductsWorker.self)] - getProductsBySearch: \(String(describing: error))")
            completitionFailure()
        }
    }
}
