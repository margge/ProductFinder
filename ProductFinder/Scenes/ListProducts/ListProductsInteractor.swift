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
    var worker: ListProductsWorkerProtocol = ListProductsWorker()
    var productId: String = ""
    
    // MARK: Do Load Products
    
    func loadProducts(request: ListProducts.Load.Request) {
        
        worker.getProductsByCategory { productData in
            let response = ListProducts.Load.Response(productData: productData)
            self.presenter?.presentProducts(response: response)
        } completitionFailure: { error in
            self.presenter?.presentError()
        }
    }
    
    func searchProducts(request: ListProducts.Search.Request) {
        
        worker.getProductsBySearch(query: request.query) { productData in
            let response = ListProducts.Load.Response(productData: productData)
            self.presenter?.presentProducts(response: response)
        } completitionFailure: {
            self.presenter?.presentError()
        }
    }
}
