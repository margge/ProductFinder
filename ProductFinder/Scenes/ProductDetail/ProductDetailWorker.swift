//
//  ProductDetailWorker.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit

class ProductDetailWorker {
    
    func getProductDetail(productId: String,
                          completitionHandler: @escaping ([ItemData]) -> Void) {
        
        NetworkProvider.shared.getProductDetail(productId: productId) { itemsData in
            completitionHandler(itemsData)
        } failure: { error in
            print("[\(ProductDetailWorker.self)] - getProductDetail: \(String(describing: error))")
        }
    }
}
