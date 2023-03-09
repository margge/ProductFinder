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
    
    func getProductDetail(productId: String,
                          completitionHandler: @escaping ([ItemData]) -> Void,
                          completitionFailure: @escaping () -> ()) {
        
        NetworkProvider.shared.getProductDetail(productId: productId) { itemsData in
            completitionHandler(itemsData)
        } failure: { error in
            print("[\(ProductDetailWorker.self)] - getProductDetail: \(String(describing: error))")
            completitionFailure()
        }
    }
}
