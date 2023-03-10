//
//  ProductDetailModels.swift
//  ProductFinder
//
//  Created by Margge Guiza.
//

import UIKit

enum ProductDetail {
    // MARK: Use cases
    
    enum GetProductDetail {
        struct Request {
            let productId: String
        }
        struct Response {
            let items: [ItemData]
        }
        struct ViewModel {
            let productItemViewModel: ProductItemViewModel
        }
    }
}

struct ProductItemViewModel {
    let id: String
    let title: String
    let price: String
    let availableQuantity: String
    let soldQuantity: String
    let condition: String
    let thumbnail: String?
    let internationalDelivery: String
    let attributes: [AttributeViewModel]
    let warranty: String
    let description: String
}

struct AttributeViewModel {
    let id: String
    let name: String?
    let valueName: String?
}
