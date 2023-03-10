//
//  ProductDetailWorkerProtocolSpy.swift
//
//

@testable import ProductFinder

final class ProductDetailWorkerProtocolSpy: ProductDetailWorkerProtocol {
    
    // MARK: - Properties
    
    var isErrorCase = false
    
    // MARK: - Calls
    
    private(set) var getProductDetailCalled = false
    
    // MARK: - ProductDetailWorkerProtocol
    
    func getProductDetail(productId: String,
                          completitionHandler: @escaping ([ItemData]) -> Void,
                          completitionFailure: @escaping () -> ()) {
        getProductDetailCalled = true
        
        if isErrorCase {
            completitionFailure()
        } else {
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
            completitionHandler(items)
        }
    }
}
