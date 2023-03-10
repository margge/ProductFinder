//
//  ProductDetailWorkerTests.swift
//
//

import Foundation
@testable import ProductFinder
import XCTest

final class ProductDetailWorkerTests: XCTestCase {

    // MARK: - Subject under test

    var sut: ProductDetailWorker!
    var apiSpy: APISpy!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()
        apiSpy = APISpy()
        sut = ProductDetailWorker(networkProvider: apiSpy)
    }

    override func tearDown() {
        sut = nil
        apiSpy = nil
        super.tearDown()
    }

    // MARK: - Tests
    
    func testGetProductDetailSuccess() {
        //Given
        apiSpy.isErrorCase = false
        
        //When
        sut.getProductDetail(productId: "") { itemData in
            XCTAssertNotNil(itemData)
        } completitionFailure: {}
        
        //Then
        XCTAssertTrue(apiSpy.getProductDetailCalled)
        XCTAssertFalse(apiSpy.getProductDetailGotError)
        XCTAssertTrue(apiSpy.getProductDetailGotSuccess)
    }
    
    func testGetProductDetailFailure() {
        //Given
        apiSpy.isErrorCase = true
        
        //When
        sut.getProductDetail(productId: "") { itemData in
            XCTAssertNil(itemData)
        } completitionFailure: {}
        
        //Then
        XCTAssertTrue(apiSpy.getProductDetailCalled)
        XCTAssertTrue(apiSpy.getProductDetailGotError)
        XCTAssertFalse(apiSpy.getProductDetailGotSuccess)
    }
}
