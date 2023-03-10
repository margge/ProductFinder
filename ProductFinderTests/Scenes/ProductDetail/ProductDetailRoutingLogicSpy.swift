//
//  ProductDetailRoutingLogicSpy.swift
//
//

@testable import ProductFinder

final class ProductDetailRoutingLogicSpy: ProductDetailRoutingLogic, ProductDetailDataPassing {

    // MARK: - Properties

    private(set) var dataStore: ProductDetailDataStore?

    // MARK: - Calls

//    private(set) var routeToSomewhereCalled = false

    // MARK: - ProductDetailRoutingLogic

//    func routeToSomewhere() {
//        routeToSomewhereCalled = true
//    }
}
