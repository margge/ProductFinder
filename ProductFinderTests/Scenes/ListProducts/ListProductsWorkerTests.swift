//
//  ListProductsWorkerTests.swift
//
//

import Foundation
@testable import ProductFinder
import XCTest

final class ListProductsWorkerTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: ListProductsWorker!
    var apiSpy: APISpy!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        apiSpy = APISpy()
        sut = ListProductsWorker(networkProvider: apiSpy)
    }
    
    override func tearDown() {
        sut = nil
        apiSpy = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testGetProductsByCategorySuccess() {
        //Given
        apiSpy.isErrorCase = false
        
        //When
        sut.getProductsByCategory(completitionHandler: { productData in
            XCTAssertNotNil(productData)
        }, completitionFailure: { error in
            XCTAssertNil(error)
        })
        
        //Then
        XCTAssertTrue(apiSpy.getProductsByCategoryCalled)
        XCTAssertFalse(apiSpy.getProductsByCategoryGotError)
        XCTAssertTrue(apiSpy.getProductsByCategoryGotSuccess)
    }
    
    func testGetProductsByCategoryFailure() {
        //Given
        apiSpy.isErrorCase = true
        
        //When
        sut.getProductsByCategory(completitionHandler: { productData in
            XCTAssertNil(productData)
        }, completitionFailure: { error in
            XCTAssertNotNil(error)
        })
        
        //Then
        XCTAssertTrue(apiSpy.getProductsByCategoryCalled)
        XCTAssertTrue(apiSpy.getProductsByCategoryGotError)
        XCTAssertFalse(apiSpy.getProductsByCategoryGotSuccess)
    }
    
    func testGetProductsBySearchSuccess() {
        //Given
        apiSpy.isErrorCase = false
        
        //When
        sut.getProductsBySearch(query: "Nintendo") { productData in
            XCTAssertNotNil(productData)
        } completitionFailure: {}
        
        //Then
        XCTAssertTrue(apiSpy.getProductsBySearchCalled)
        XCTAssertFalse(apiSpy.getProductsBySearchGotError)
        XCTAssertTrue(apiSpy.getProductsBySearchGotSuccess)
    }
    
    func testGetProductsBySearchFailure() {
        //Given
        apiSpy.isErrorCase = true
        
        //When
        sut.getProductsBySearch(query: "") { productData in
            XCTAssertNil(productData)
        } completitionFailure: {}
        
        //Then
        XCTAssertTrue(apiSpy.getProductsBySearchCalled)
        XCTAssertTrue(apiSpy.getProductsBySearchGotError)
        XCTAssertFalse(apiSpy.getProductsBySearchGotSuccess)
    }
}
