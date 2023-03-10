//
//  ProductDetailViewControllerTests.swift
//
//

@testable import ProductFinder
import XCTest

final class ProductDetailViewControllerTests: XCTestCase {

    // MARK: - Subject under test

    var sut: ProductDetailViewController!
    var interactorSpy: ProductDetailBusinessLogicSpy!
    var routerSpy: ProductDetailRoutingLogicSpy!
    var window: UIWindow!

    // MARK: - Test Lifecycle

    override func setUp() {
        super.setUp()
        interactorSpy = ProductDetailBusinessLogicSpy()
        routerSpy = ProductDetailRoutingLogicSpy()
        
        sut = (UIStoryboard(name: "ProductDetail", bundle: nil)
                .instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController)
        sut.interactor = interactorSpy
        
        window = UIWindow()
        window.rootViewController = sut
        window.makeKeyAndVisible()
    }

    override func tearDown() {
        window = nil
        sut = nil
        routerSpy = nil
        interactorSpy = nil
        super.tearDown()
    }

    // MARK: - Tests
    
    func testGetProductDetail(){
        //Given
        sut.productId = ""
        
        //When
        sut.getProductDetail()
        
        //Then
        XCTAssertTrue(interactorSpy.getProductDetailCalled)
        XCTAssertTrue(sut.containerView.isHidden)
        XCTAssertTrue(interactorSpy.getProductDetailCalled)
    }
    
    func testGetProductDetailNeverCalled() {
        //Given
        sut.productId = nil
        
        //When
        sut.getProductDetail()
        
        //Then
        XCTAssertFalse(interactorSpy.getProductDetailCalled)
    }
    
    func testDisplayProductDetail() {
        //Given
        let productItemViewModel = ProductItemViewModel.init(id: "",
                                                             title: "",
                                                             price: "$50.000",
                                                             availableQuantity: "",
                                                             soldQuantity: "",
                                                             condition: "",
                                                             thumbnail: "",
                                                             internationalDelivery: "",
                                                             attributes: [],
                                                             warranty: "",
                                                             description: "")
        let viewModel = ProductDetail.GetProductDetail.ViewModel.init(productItemViewModel: productItemViewModel)
        
        //When
        sut.displayProductDetail(viewModel: viewModel)
        
        //Then
        XCTAssertFalse(sut.containerView.isHidden)
        XCTAssertTrue(sut.progressIndicator.isHidden)
    }
    
    func testShowLoading() {
        //When
        sut.showLoading()
        
        //Then
        XCTAssertTrue(sut.containerView.isHidden)
    }
    
    func testHideLoading() {
        //When
        sut.hideLoading()
        
        //Then
        XCTAssertFalse(sut.containerView.isHidden)
    }
}
