//
//  ListProductsModels.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit

enum ListProducts{
    
    // MARK: Use cases
    
    enum Load{
        struct Request {
        }
        struct Response {
            let productData: ProductData
        }
        struct ViewModel {
            let productListViewModel: ProductListViewModel
        }
    }
    
    enum Search{
        struct Request {
            let query:String
        }
        struct Response {
            let productData: ProductData
        }
        struct ViewModel {
            let productData: ProductData
        }
    }
    
    enum ShowProductDetail {
        struct Request {
            let productId: String
        }
        struct Response {
            let productId: String
        }
        struct ViewModel {
            let productId: String
        }
    }
}

struct ProductListViewModel {
    let paging: PagingViewModel
    let results: [ProductViewModel]
}

struct PagingViewModel {
    let offset: Int
    let limit: Int
}

struct ProductViewModel {
    let id: String
    let title: String
    let thumbnail: String?
    let price: String
}
