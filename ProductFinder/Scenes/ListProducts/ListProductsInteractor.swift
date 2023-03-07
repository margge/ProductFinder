//
//  ListProductsInteractor.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit

protocol ListProductsBusinessLogic {
    func loadProducts(request: ListProducts.Load.Request)
    func searchProducts(request: ListProducts.Search.Request)
}

protocol ListProductsDataStore {
    var productId: String { get set }
}

class ListProductsInteractor: ListProductsBusinessLogic, ListProductsDataStore {
    
    var presenter: ListProductsPresentationLogic?
    var worker: ListProductsWorker?    
    var productId: String = ""
    
    // MARK: Do Load Products
    
    func loadProducts(request: ListProducts.Load.Request) {
        
        worker = ListProductsWorker()
        worker?.getProductsByCategory(completitionHandler: { productData in
            let response = ListProducts.Load.Response(productData: productData)
            self.presenter?.presentProducts(response: response)
        })
    }
    
    func searchProducts(request: ListProducts.Search.Request) {
        
        worker = ListProductsWorker()
        worker?.getProductsBySearch(query: request.query, completitionHandler: { productData in
            let response = ListProducts.Load.Response(productData: productData)
            self.presenter?.presentProducts(response: response)
        })
    }
}
