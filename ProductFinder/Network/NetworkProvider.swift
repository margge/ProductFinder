//
//  NetworkProvider.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import Foundation
import Alamofire

protocol NetworkProviderProtocol {
    func getProductsByCategory(success: @escaping (_ productsData: ProductData) -> Void,
                               failure: @escaping (_ error: Error?) -> Void)
    
    func getProductsBySearch(searchQuery: String,
                             success: @escaping (_ productData: ProductData) -> Void,
                             failure: @escaping (_ error: Error?) -> Void)
    
    func getProductDetail(productId: String,
                          success: @escaping (_ itemData: [ItemData]) -> Void,
                          failure: @escaping (_ error: Error?) -> Void)
}

final class NetworkProvider: NetworkProviderProtocol {
    
    static let shared = NetworkProvider()
    
    private let kBaseSite = "MLC"
    private let kBaseCategory = "MLC1144"
    private let KBaseUrl = "https://api.mercadolibre.com/"
    private let kStatusOk = 200...299
    
    func getProductsByCategory(success: @escaping (_ productsData: ProductData) -> Void,
                               failure: @escaping (_ error: Error?) -> Void) {
        
        let url = "\(KBaseUrl)sites/\(kBaseSite)/search?category=\(kBaseCategory)"
        
        AF.request(url, method: .get)
            .validate(statusCode: kStatusOk)
            .responseDecodable(of: ProductData.self) { response in
                
                if let productData = response.value {
                    success(productData)
                }
                
                if let responseError = response.error {
                    print("[\(NetworkProvider.self)] - getProductsByCategory: \(responseError)")
                    failure(response.error)
                }
            }
    }
    
    func getProductsBySearch(searchQuery: String,
                             success: @escaping (_ productData: ProductData) -> Void,
                             failure: @escaping (_ error: Error?) -> Void) {
        
        let url = "\(KBaseUrl)sites/\(kBaseSite)/search?q=\(searchQuery)"
        
        AF.request(url, method: .get)
            .validate(statusCode: kStatusOk)
            .responseDecodable(of: ProductData.self) { response in
                
                if let productData = response.value {
                    success(productData)
                }
                
                if let responseError = response.error {
                    print("[\(NetworkProvider.self)] - getProductsBySearch: \(responseError)")
                    failure(response.error)
                }
            }
    }
    
    func getProductDetail(productId: String,
                          success: @escaping (_ itemData: [ItemData]) -> Void,
                          failure: @escaping (_ error: Error?) -> Void) {
        
        let url = "\(KBaseUrl)/items?ids=\(productId)"
        
        AF.request(url, method: .get)
            .validate(statusCode: kStatusOk)
            .responseDecodable(of: [ItemData].self) { response in
                
                if let productData = response.value {
                    success(productData)
                }
                
                if let responseError = response.error {
                    print("[\(NetworkProvider.self)] - getProductDetail: \(responseError)")
                    failure(response.error)
                }
            }
    }
}
