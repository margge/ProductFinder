//
//  ListProductsDisplayLogicSpy.swift
//
//  Created by Margge Guiza
//
//

@testable import ProductFinder

final class ListProductsDisplayLogicSpy: ListProductsDisplayLogic {
    
    // MARK: - Calls
    
    private(set) var displayProductsCalled = false
    private(set) var displayErrorAlertCalled = false
    
    // MARK: - ListProductsDisplayLogic
    
    func displayProducts(viewModel: ListProducts.Load.ViewModel) {
        displayProductsCalled = true
    }
    
    func displayErrorAlert() {
        displayErrorAlertCalled = true
    }
}
