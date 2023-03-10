//
//  ProductDetailDisplayLogicSpy.swift
//
//

@testable import ProductFinder

final class ProductDetailDisplayLogicSpy: ProductDetailDisplayLogic {

    // MARK: - Calls

    private(set) var displayProductDetailCalled = false
    private(set) var displayErrorAlertCalled = false

    // MARK: - ProductDetailDisplayLogic
    
    func displayProductDetail(viewModel: ProductDetail.GetProductDetail.ViewModel) {
        displayProductDetailCalled = true
    }
    
    func displayErrorAlert() {
        displayErrorAlertCalled = true        
    }
}
