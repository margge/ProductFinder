//
//  ProductDetailPresentationLogicSpy.swift
//
//

@testable import ProductFinder

final class ProductDetailPresentationLogicSpy: ProductDetailPresentationLogic {

    // MARK: - Calls

    private(set) var presentProductDetailCalled = false
    private(set) var presentErrorCalled = false

    // MARK: - ProductDetailPresentationLogic
    
    func presentProductDetail(response: ProductDetail.GetProductDetail.Response) {
        presentProductDetailCalled = true
    }
    
    func presentError() {
        presentErrorCalled = true
    }
}
