//
//  ProductDetailPresenter.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit

protocol ProductDetailPresentationLogic {
    func presentProductDetail(response: ProductDetail.GetProductDetail.Response)
    func presentError()
}

class ProductDetailPresenter: ProductDetailPresentationLogic {
    var viewController: ProductDetailDisplayLogic?
    
    // MARK: presentProductDetail
    
    func presentProductDetail(response: ProductDetail.GetProductDetail.Response) {
        
        if let productItem = response.items.first {
            let productDetail = productItem.productDetail
            
            var attributesViewModelList : [AttributeViewModel] = []
            
            var productDetailDescription: String = ""
            
            productDetail.attributes.forEach {
                let attributesViewModel = AttributeViewModel(id: $0.id,
                                                             name: $0.name,
                                                             valueName: $0.valueName)
                
                if let attrName = $0.name, let attrValueName = $0.valueName {
                    productDetailDescription.append(contentsOf: "▸ \(attrName): \(attrValueName)\n")
                    
                }
                
                attributesViewModelList.append(attributesViewModel)
            }
            
            let productDetailViewModel = ProductItemViewModel(id: productDetail.id,
                                                              title: productDetail.title,
                                                              price: String(productDetail.price),
                                                              availableQuantity: String(productDetail.availableQuantity),
                                                              soldQuantity: String(productDetail.soldQuantity),
                                                              condition: productDetail.condition,
                                                              thumbnail: productDetail.thumbnail,
                                                              internationalDelivery: productDetail.internationalDelivery,
                                                              attributes: attributesViewModelList,
                                                              warranty: productDetail.warranty,
                                                              description: productDetailDescription)
            
            let viewModel = ProductDetail.GetProductDetail.ViewModel(productItemViewModel: productDetailViewModel)
            viewController?.displayProductDetail(viewModel: viewModel)
        }
    }
    
    func presentError() {
        viewController?.displayErrorAlert()
    }
}
