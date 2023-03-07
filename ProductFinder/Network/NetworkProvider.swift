//
//  NetworkProvider.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import Foundation
import Alamofire

final class NetworkProvider {
    
    static let shared = NetworkProvider()
    
    private let kBaseSite = "MLA"
    private let kBaseCategory = "MLA5725"
    private let KBaseUrl = "https://api.mercadolibre.com/"
    private let kStatusOk = 200...299
    
    func getProductsByCategory(success: @escaping (_ productsData:ProductData) -> (),
                               failure: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(KBaseUrl)sites/\(kBaseSite)/search?category=\(kBaseCategory)"
        
        AF.request(url, method: .get)
            .validate(statusCode: kStatusOk)
            .responseDecodable (of: ProductData.self) { response in
                
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
                             success: @escaping (_ productData: ProductData) -> (),
                             failure: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(KBaseUrl)sites/\(kBaseSite)/search?q=\(searchQuery)"
        
        AF.request(url, method: .get)
            .validate(statusCode: kStatusOk)
            .responseDecodable (of: ProductData.self) { response in
                
                if let productData = response.value {
                    success(productData)
                }
                
                if let responseError = response.error {
                    print("[\(NetworkProvider.self)] - getProductsBySearch: \(responseError)")
                    failure(response.error)
                }
            }
    }
}
