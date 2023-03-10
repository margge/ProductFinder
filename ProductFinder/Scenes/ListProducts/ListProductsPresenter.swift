//
//  ListProductsPresenter.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit

protocol ListProductsPresentationLogic {
    func presentProducts(response: ListProducts.Load.Response)
    func presentError()
}

class ListProductsPresenter: ListProductsPresentationLogic {
    
    weak var viewController: ListProductsDisplayLogic?
    
    // MARK: presentProducts
    
    func presentProducts(response: ListProducts.Load.Response) {
        
        let productData = response.productData
        let pagingData = productData.paging
        
        let pagingViewModel = PagingViewModel.init(offset: pagingData.offset,
                                                   limit: pagingData.limit)
        var productViewModels: [ProductViewModel] = []
        
        productData.results.forEach {
            
            var productImageUrl: String?
            if let thumbnailUrl = $0.thumbnail {
                if thumbnailUrl.contains(Constants.kUnSafeHttp) {
                    productImageUrl = thumbnailUrl.replacingOccurrences(of: Constants.kUnSafeHttp, with: Constants.kSafeHttp)
                }
            }
            
            let productViewModel = ProductViewModel(id: $0.id,
                                                    title: $0.title,
                                                    thumbnail: productImageUrl,
                                                    price: "$\($0.price)")
            
            productViewModels.append(productViewModel)
        }
        
        let productListViewModel = ProductListViewModel.init(paging: pagingViewModel,
                                                             results: productViewModels)
        
        let viewModel = ListProducts.Load.ViewModel(productListViewModel: productListViewModel)
        viewController?.displayProducts(viewModel: viewModel)
    }
    
    func presentError() {
        viewController?.displayErrorAlert()
    }
}
