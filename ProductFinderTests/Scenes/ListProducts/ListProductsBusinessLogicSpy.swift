//
//  ListProductsBusinessLogicSpy.swift
//
//

@testable import ProductFinder

final class ListProductsBusinessLogicSpy: ListProductsBusinessLogic {
    
    // MARK: - Calls
    
    private(set) var loadProductsCalled = false
    private(set) var searchProductsCalled = false
    
    // MARK: - ListProductsBusinessLogic
    
    func loadProducts(request: ListProducts.Load.Request) {
        loadProductsCalled = true
    }
    
    func searchProducts(request: ListProducts.Search.Request) {
        searchProductsCalled = false
    }
}
