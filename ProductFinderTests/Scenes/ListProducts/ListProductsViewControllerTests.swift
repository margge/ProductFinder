//
//  ListProductsViewControllerTests.swift
//
//

@testable import ProductFinder
import XCTest

final class ListProductsViewControllerTests: XCTestCase {

    // MARK: - Subject under test

    var sut: ListProductsViewController!
    var interactorSpy: ListProductsBusinessLogicSpy!
    var presenterSpy: ListProductsPresenter!
    var routerSpy: ListProductsRoutingLogicSpy!
    var window: UIWindow!

    // MARK: - Test Lifecycle

    override func setUp() {
        super.setUp()
        
        interactorSpy = ListProductsBusinessLogicSpy()
        routerSpy = ListProductsRoutingLogicSpy()
        sut = (UIStoryboard(name: "ListProducts", bundle: nil)
                .instantiateViewController(withIdentifier: "ListProductsViewController") as! ListProductsViewController)
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
    
    func testLoadProducts() {
        //When
        sut.loadProducts()
        
        //Then
        XCTAssertTrue(interactorSpy.loadProductsCalled)
        XCTAssertTrue(sut.productsCollectionView.isHidden)
        XCTAssertTrue(interactorSpy.loadProductsCalled)
    }
    
    func testDisplayProducts() {        
        //Given
        let productViewModel = ProductViewModel.init(id: "5", title: "Nintendo Switch", thumbnail: "", price: "40000")
        let productViewModelList = [productViewModel, productViewModel, productViewModel, productViewModel]
        let pagingViewModel = PagingViewModel.init(offset: 5, limit: 10)
        let productListViewModel = ProductListViewModel.init(paging: pagingViewModel, results: productViewModelList)
        let viewModel = ListProducts.Load.ViewModel.init(productListViewModel: productListViewModel )
        
        //When
        sut.displayProducts(viewModel: viewModel)
        
        //Then
        XCTAssertFalse(sut.productsCollectionView.isHidden)
        XCTAssertEqual(sut.productsCollectionView.numberOfItems(inSection: 0), 4)
    }
    
    func testDisplayErrorAlert() {
        //When
        sut.displayErrorAlert()
        
        //Then
        XCTAssertTrue(sut.productsCollectionView.isHidden)
    }
    
    func testShowLoading() {
        //When
        sut.showLoading()
        
        //Then
        XCTAssertTrue(sut.productsCollectionView.isHidden)
    }
    
    func testHideLoading() {
        //When
        sut.hideLoading()
        
        //Then
        XCTAssertFalse(sut.productsCollectionView.isHidden)
    }
}
