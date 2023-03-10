//
//  ListProductsWorkerTests.swift
//
//

import Foundation
@testable import ProductFinder
import XCTest

final class ListProductsWorkerTests: XCTestCase {

    // MARK: - Subject under test

    //typealias APISpyClass = APISpy
    //var apiSpy: APISpyClass!
    var sut: ListProductsWorker!
    // var apiSpy: NetworkProvider(Date)

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()
        //apiSpy = APISpyClass()
        //sut = ListProductsWorker(apiService: apiSpy)
        sut = ListProductsWorker()
    }

    override func tearDown() {
        sut = nil
        //apiSpy = nil
        super.tearDown()
    }

    // MARK: - Tests
    
    func testGetProductsByCategory() {
        //Given
        
        
        
        //When
        sut.getProductsByCategory { productData in
            
            //Then
            XCTAssertNotNil(productData)
        } completitionFailure: { error in
            
            //Then
            XCTAssertNil(error)
        }

        
//        NetworkProvider.shared.getProductsByCategory { products in
//            completitionHandler(products)
//        } failure: { error in
//            print("[\(ListProductsWorker.self)] - getProductsByCategory: \(String(describing: error))")
//            completitionFailure(error)
//        }
    }
    
    func testGetProductsBySearch() {
        
//        NetworkProvider.shared.getProductsBySearch(searchQuery: query) { products in
//            completitionHandler(products)
//        } failure: { error in
//            print("[\(ListProductsWorker.self)] - getProductsBySearch: \(String(describing: error))")
//            completitionFailure()
//        }
    }

//    func testFetchSomething_Success() {
//        sut.fetchSomething { response in
//            XCTAssertNotNil(response)
//        } failure: { error in
//            XCTAssertNil(error)
//        }
//
//        XCTAssertTrue(apiSpy.getSomethingCalled)
//    }

//    func testFetchClientProfile_Failure() {
//        apiSpy.isErrorCase = true
//
//        sut.fetchSomething { response in
//            XCTAssertNil(response)
//        } failure: { error in
//            XCTAssertNotNil(error)
//        }
//
//        XCTAssertTrue(apiSpy.getSomethingCalled)
//    }
}
