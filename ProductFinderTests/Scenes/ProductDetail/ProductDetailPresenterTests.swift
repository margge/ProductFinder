//
//  ProductDetailPresenterTests.swift
//
//

@testable import ProductFinder
import XCTest

final class ProductDetailPresenterTests: XCTestCase {

    // MARK: - Subject under test

    var sut: ProductDetailPresenter!
    var viewControllerSpy: ProductDetailDisplayLogicSpy!

    // MARK: - Test Lifecycle

    override func setUp() {
        super.setUp()
        viewControllerSpy = ProductDetailDisplayLogicSpy()
        sut = ProductDetailPresenter()
        sut.viewController = viewControllerSpy
    }

    override func tearDown() {
        sut = nil
        viewControllerSpy = nil
        super.tearDown()
    }

    // MARK: - Tests

    func testpresentProductDetail() {
        //Given
        let productItem = ProductItem.init(id: "",
                                           title: "",
                                           price: 55.000,
                                           availableQuantity: 5,
                                           soldQuantity: 20,
                                           condition: "NEW",
                                           thumbnail: "",
                                           internationalDelivery: "",
                                           attributes: [],
                                           warranty: "1 Año")
        let itemData = ItemData.init(code: 200,
                                     productDetail: productItem)
        let items = [itemData]
        let response = ProductDetail.GetProductDetail.Response.init(items: items)
        
        //When
        sut.presentProductDetail(response: response)
        
        //Then
        XCTAssertTrue(viewControllerSpy.displayProductDetailCalled)
        XCTAssertFalse(viewControllerSpy.displayErrorAlertCalled)
    }
    
    func testPresentError() {
        //When
        sut.presentError()
        
        //Then
        XCTAssertTrue(viewControllerSpy.displayErrorAlertCalled)
        XCTAssertFalse(viewControllerSpy.displayProductDetailCalled)
    }
}
