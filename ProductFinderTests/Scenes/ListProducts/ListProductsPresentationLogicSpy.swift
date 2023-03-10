//
//  ListProductsPresentationLogicSpy.swift
//
//  Created by Margge Guiza
//

@testable import ProductFinder

final class ListProductsPresentationLogicSpy: ListProductsPresentationLogic {
      
    // MARK: - Calls
        
    private(set) var presentProductsCalled = false
    private(set) var presentErrorCalled = false
    
    // MARK: - ListProductsPresentationLogic
        
    func presentProducts(response: ListProducts.Load.Response) {
        presentProductsCalled = true
    }
    
    func presentError() {
        presentErrorCalled = true
    }
}
