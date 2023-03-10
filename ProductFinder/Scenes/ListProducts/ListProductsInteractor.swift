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
    
    private let presenter: ListProductsPresentationLogic
    private let worker: ListProductsWorkerProtocol
    var productId: String = ""
    
    init(worker: ListProductsWorkerProtocol = ListProductsWorker(),
         presenter: ListProductsPresentationLogic) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: Do Load Products
    
    func loadProducts(request: ListProducts.Load.Request) {
        
        worker.getProductsByCategory { [weak self] productData in
            
            let response = ListProducts.Load.Response(productData: productData)
            self?.presenter.presentProducts(response: response)
            
        } completitionFailure: { [weak self] error in
            self?.presenter.presentError()
        }
    }
    
    func searchProducts(request: ListProducts.Search.Request) {
        
        worker.getProductsBySearch(query: request.query) { [weak self] productData in
            
            let response = ListProducts.Load.Response(productData: productData)
            self?.presenter.presentProducts(response: response)
            
        } completitionFailure: { [weak self] in
            self?.presenter.presentError()
        }
    }
}
