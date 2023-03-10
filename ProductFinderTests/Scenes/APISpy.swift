//
//  APISpy.swift
//  ProductFinderTests
//
//  Created by Margge Guiza
//

@testable import ProductFinder

final class APISpy: NetworkProviderProtocol {
    
    // MARK: - Properties
    
    var isErrorCase = false
    
    // MARK: - Calls
    
    private(set) var getProductsByCategoryCalled = false
    private(set) var getProductsByCategoryGotError = false
    private(set) var getProductsByCategoryGotSuccess = false
    
    private(set) var getProductsBySearchCalled = false
    private(set) var getProductsBySearchGotError = false
    private(set) var getProductsBySearchGotSuccess = false
    
    private(set) var getProductDetailCalled = false
    private(set) var getProductDetailGotError = false
    private(set) var getProductDetailGotSuccess = false
    
    // MARK: - ListProductsWorkerProtocol
    
    func getProductsByCategory(success: @escaping (ProductData) -> (),
                               failure: @escaping (Error?) -> ()) {
        
        getProductsByCategoryCalled = true
        
        if isErrorCase {
            getProductsByCategoryGotError = true
            getProductsByCategoryGotSuccess = false
            failure(ErrorModel())
        } else {
            let productData = ProductData(paging: Paging(offset: 5,
                                                         limit: 9),
                                          results: [])
            
            getProductsByCategoryGotSuccess = true
            getProductsByCategoryGotError = false
            success(productData)
        }
    }
    
    func getProductsBySearch(searchQuery: String,
                             success: @escaping (ProductData) -> (),
                             failure: @escaping (Error?) -> ()) {
        
        getProductsBySearchCalled = true
        
        if isErrorCase {
            getProductsBySearchGotError = true
            getProductsBySearchGotSuccess = false
            failure(ErrorModel())
        } else {
            let productData = ProductData(paging: Paging(offset: 5,
                                                         limit: 9),
                                          results: [])
            
            getProductsBySearchGotSuccess = true
            getProductsBySearchGotError = false
            success(productData)
        }
    }
    
    func getProductDetail(productId: String,
                          success: @escaping ([ItemData]) -> (),
                          failure: @escaping (Error?) -> ()) {
        
        getProductDetailCalled = true
        
        if isErrorCase {
            getProductDetailGotError = true
            getProductDetailGotSuccess = false
            failure(ErrorModel())
            
        } else {
            getProductDetailGotSuccess = true
            getProductDetailGotError = false
            success([])
        }
    }
}
