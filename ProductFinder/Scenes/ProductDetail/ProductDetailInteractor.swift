//
//  ProductDetailInteractor.swift
//  ProductFinder
//
//  Created by Margge Guiza.
//

import UIKit

protocol ProductDetailBusinessLogic {
    func getProductDetail(request: ProductDetail.GetProductDetail.Request)
}

protocol ProductDetailDataStore {
}

class ProductDetailInteractor: ProductDetailBusinessLogic, ProductDetailDataStore {

    var worker: ProductDetailWorkerProtocol
    var presenter: ProductDetailPresentationLogic
    
    init(worker: ProductDetailWorkerProtocol = ProductDetailWorker(),
         presenter: ProductDetailPresentationLogic) {
        self.worker = worker
        self.presenter = presenter
    }
    
    // MARK: GetProductDetail
    
    func getProductDetail(request: ProductDetail.GetProductDetail.Request) {
        
        worker.getProductDetail(productId: request.productId,
                                completitionHandler: { [weak self] itemsData in
            
            let response = ProductDetail.GetProductDetail.Response(items: itemsData)
            self?.presenter.presentProductDetail(response: response)
            
        }, completitionFailure: {[weak self] in
            
            self?.presenter.presentError()
        })
    }
}
