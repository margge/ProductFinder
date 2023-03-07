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
    
    var presenter: ProductDetailPresentationLogic?
    var worker: ProductDetailWorker?
    
    // MARK: GetProductDetail
    
    func getProductDetail(request: ProductDetail.GetProductDetail.Request) {
        
        worker = ProductDetailWorker()
        worker?.getProductDetail(productId: request.productId, completitionHandler: { itemsData in
            
            let response = ProductDetail.GetProductDetail.Response(items: itemsData)
            self.presenter?.presentProductDetail(response: response)
        })
    }
}
