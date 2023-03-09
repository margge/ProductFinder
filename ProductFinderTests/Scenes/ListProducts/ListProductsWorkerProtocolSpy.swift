//
//  ListProductsWorkerProtocolSpy.swift
//
//

@testable import ProductFinder

final class ListProductsWorkerProtocolSpy: ListProductsWorkerProtocol {

    // MARK: - Properties

    var isErrorCase = false

    // MARK: - Calls
    
    private(set) var getProductsByCategoryCalled = false
    private(set) var getProductsBySearchCalled = false

    // MARK: - ListProductsWorkerProtocol
    
    func getProductsByCategory(completitionHandler: @escaping (ProductData) -> Void,
                               completitionFailure: @escaping (Error?) -> ()) {

        getProductsByCategoryCalled = true
        
        if isErrorCase {
            completitionFailure(ErrorModel())
        } else {
            let productData = ProductData(paging: Paging(offset: 5, limit: 9),
                                          results: [])
            completitionHandler(productData)
        }
    }
    
    func getProductsBySearch(query: String,
                             completitionHandler: @escaping (ProductData) -> Void,
                             completitionFailure: @escaping () -> ()) {
        getProductsBySearchCalled = true
        
        if isErrorCase {
            completitionFailure()
        } else {
            let productData = ProductData(paging: Paging(offset: 5, limit: 9),
                                          results: [])
            completitionHandler(productData)
        }
    }
}

// MARK: - Mocks

struct ErrorModel: Error {}
