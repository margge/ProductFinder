//
//  ProductDetailWorker.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit

protocol ProductDetailWorkerProtocol {
    func getProductDetail(productId: String,
                          completitionHandler: @escaping ([ItemData]) -> Void,
                          completitionFailure: @escaping () -> ())
}

class ProductDetailWorker: ProductDetailWorkerProtocol {
    
    private let networkProvider: NetworkProviderProtocol
    
    init(networkProvider: NetworkProviderProtocol = NetworkProvider.shared) {
        self.networkProvider = networkProvider
    }
    
    func getProductDetail(productId: String,
                          completitionHandler: @escaping ([ItemData]) -> Void,
                          completitionFailure: @escaping () -> ()) {
        
        networkProvider.getProductDetail(productId: productId) { itemsData in
            completitionHandler(itemsData)
            
        } failure: { error in
            
            print("[\(ProductDetailWorker.self)] - getProductDetail: \(String(describing: error))")
            completitionFailure()
        }
    }
}
