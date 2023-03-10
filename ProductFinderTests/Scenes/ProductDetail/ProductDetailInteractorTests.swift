//
//  ProductDetailInteractorTests.swift
//
//

@testable import ProductFinder
import XCTest

final class ProductDetailInteractorTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: ProductDetailInteractor!
    var presenterSpy: ProductDetailPresentationLogicSpy!
    var workerSpy: ProductDetailWorkerProtocolSpy!
    
    // MARK: - Test Lifecycle
    
    override func setUp() {
        super.setUp()
        workerSpy = ProductDetailWorkerProtocolSpy()
        presenterSpy = ProductDetailPresentationLogicSpy()
        sut = ProductDetailInteractor(worker: workerSpy, presenter: presenterSpy)
    }
    
    override func tearDown() {
        sut = nil
        presenterSpy = nil
        workerSpy = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testGetProductDetail() {
        //Given
        let request = ProductDetail.GetProductDetail.Request.init(productId: "MLC609828647")
        
        //When
        sut.getProductDetail(request: request)
        
        //Then
        XCTAssertTrue(workerSpy.getProductDetailCalled)
        XCTAssertTrue(presenterSpy.presentProductDetailCalled)
    }
    
    func testGetProductDetailFail() {
        //Given
        let request = ProductDetail.GetProductDetail.Request.init(productId: "MLC609828647")
        workerSpy.isErrorCase = true
        
        //When
        sut.getProductDetail(request: request)
        
        //Then
        XCTAssertTrue(workerSpy.getProductDetailCalled)
        XCTAssertTrue(presenterSpy.presentErrorCalled)
        XCTAssertFalse(presenterSpy.presentProductDetailCalled)
    }
}
