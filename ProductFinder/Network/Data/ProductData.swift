//
//  ProductData.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import Foundation

struct ProductData: Decodable {
    let paging: Paging
    let results: [Product]
}

struct Paging: Decodable {
    let offset: Int
    let limit: Int
}

struct Product: Decodable {
    let id: String
    let title: String
    let thumbnail: String?
    let price: Double?
}
