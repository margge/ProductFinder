//
//  ListProductsWorker.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit

class ListProductsWorker {
    
    func getProductsByCategory(completitionHandler: @escaping (ProductData) -> Void) {
        
        NetworkProvider.shared.getProductsByCategory { products in
            completitionHandler(products)
        } failure: { error in
            print("[\(ListProductsWorker.self)] - getProductsByCategory: \(String(describing: error))")
        }
    }
    
    func getProductsBySearch(query: String,
                             completitionHandler: @escaping (ProductData) -> Void) {
        
        NetworkProvider.shared.getProductsBySearch(searchQuery: query) { products in
            completitionHandler(products)
        } failure: { error in
            print("[\(ListProductsWorker.self)] - getProductsBySearch: \(String(describing: error))")
        }
    }
}
