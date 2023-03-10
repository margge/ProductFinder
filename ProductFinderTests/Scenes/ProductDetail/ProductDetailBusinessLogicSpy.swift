//
//  ProductDetailBusinessLogicSpy.swift
//
//

@testable import ProductFinder

final class ProductDetailBusinessLogicSpy: ProductDetailBusinessLogic {
    
    // MARK: - Calls
    
    private(set) var getProductDetailCalled = false
    
    // MARK: - ProductDetailBusinessLogic
    
    func getProductDetail(request: ProductDetail.GetProductDetail.Request) {
        getProductDetailCalled = true
    }
}
