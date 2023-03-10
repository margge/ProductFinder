//
//  ProductDetailWorkerProtocolSpy.swift
//
//

@testable import ProductFinder

final class ProductDetailWorkerProtocolSpy: ProductDetailWorkerProtocol {

    // MARK: - Properties

    var isErrorCase = false

    // MARK: - Calls

    private(set) var getProductDetailCalled = false

    // MARK: - ProductDetailWorkerProtocol
    
    func getProductDetail(productId: String,
                          completitionHandler: @escaping ([ItemData]) -> Void,
                          completitionFailure: @escaping () -> ()) {
        getProductDetailCalled = true
    }
}
