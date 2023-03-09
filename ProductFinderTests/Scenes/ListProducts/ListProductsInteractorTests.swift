//
//  ListProductsInteractorTests.swift
//
//

@testable import ProductFinder
import XCTest

final class ListProductsInteractorTests: XCTestCase {

    // MARK: - Subject under test

    var sut: ListProductsInteractor!
    var presenterSpy: ListProductsPresentationLogicSpy!
    var workerSpy: ListProductsWorkerProtocolSpy!

    // MARK: - Test Lifecycle

    override func setUp() {
        super.setUp()
        workerSpy = .init()
        presenterSpy = .init()
        sut = .init()
        sut.presenter = presenterSpy
        sut.worker = workerSpy
    }

    override func tearDown() {
        sut = nil
        presenterSpy = nil
        workerSpy = nil
        super.tearDown()
    }

    // MARK: - Tests
    
    func testLoadProducts() {
        //Given
        let request = ListProducts.Load.Request.init()
        
        //When
        sut.loadProducts(request: request)
        
        //Then
        XCTAssertTrue(workerSpy.getProductsByCategoryCalled)
        XCTAssertTrue(presenterSpy.presentProductsCalled)
    }
    
    func testSearchProducts() {
        //Given
        let request = ListProducts.Search.Request.init(query: "MLC609828647")
        
        //When
        sut.searchProducts(request: request)
        
        //Then
        XCTAssertTrue(workerSpy.getProductsBySearchCalled)
        XCTAssertTrue(presenterSpy.presentProductsCalled)
    }
    
    func testSearchProductsFail() {
        //Given
        let request = ListProducts.Search.Request.init(query: "MLC609828647")
        workerSpy.isErrorCase = true
        
        //When
        sut.searchProducts(request: request)
        
        //Then
        XCTAssertTrue(workerSpy.getProductsBySearchCalled)
        XCTAssertTrue(presenterSpy.presentErrorCalled)
        XCTAssertFalse(presenterSpy.presentProductsCalled)
    }
}
