//
//  ListProductsPresenterTests.swift
//
//

@testable import ProductFinder
import XCTest

final class ListProductsPresenterTests: XCTestCase {

    // MARK: - Subject under test

    var sut: ListProductsPresenter!
    var viewControllerSpy: ListProductsDisplayLogicSpy!

    // MARK: - Test Lifecycle

    override func setUp() {
        super.setUp()
        viewControllerSpy = ListProductsDisplayLogicSpy()
        sut = ListProductsPresenter()
        sut.viewController = viewControllerSpy
    }

    override func tearDown() {
        sut = nil
        viewControllerSpy = nil
        super.tearDown()
    }

    // MARK: - Tests
    
    func testPresentProducts() {
        //Given
        let productData = ProductData(paging: Paging(offset: 5, limit: 9), results: [])
        let response = ListProducts.Load.Response.init(productData: productData)
        
        //When
        sut.presentProducts(response: response)
        
        //Then
        XCTAssertTrue(viewControllerSpy.displayProductsCalled)
    }
    
    func testPresentError() {
        //When
        sut.presentError()
        
        //Then
        XCTAssertFalse(viewControllerSpy.displayProductsCalled)
    }
}
