//
//  ListProductsRoutingLogicSpy.swift
//
//  Created by Margge Guiza
//

@testable import ProductFinder

final class ListProductsRoutingLogicSpy: ListProductsRoutingLogic, ListProductsDataPassing {
    
    // MARK: - Properties
    
    private(set) var dataStore: ListProductsDataStore?
    
    // MARK: - Calls
    
    private(set) var routeToProductDetailCalled = false
    
    // MARK: - ListProductsRoutingLogic
    
    func routeToProductDetail(with productId: String) {
        routeToProductDetailCalled = true
    }
}
