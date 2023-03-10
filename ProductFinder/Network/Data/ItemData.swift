//
//  ProductDetailData.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import Foundation

struct ItemData: Decodable {
    
    let code: Int
    let productDetail: ProductItem
    
    enum CodingKeys: String, CodingKey {
        case code
        case productDetail = "body"
    }
}

struct ProductItem: Decodable {
    
    let id: String
    let title: String
    let price: Double
    let availableQuantity: Int
    let soldQuantity: Int
    let condition: String?
    let thumbnail: String?
    let internationalDelivery: String?
    let attributes: [Attribute]
    let warranty: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case condition
        case thumbnail = "secure_thumbnail"
        case attributes
        case internationalDelivery = "international_delivery_mode"
        case warranty
    }
}

struct Attribute: Decodable {
    let id: String
    let name: String?
    let valueName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case valueName = "value_name"
    }
}
