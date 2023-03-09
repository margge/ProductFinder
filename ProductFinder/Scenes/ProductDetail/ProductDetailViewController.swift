//
//  ProductDetailViewController.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import UIKit
import SDWebImage

protocol ProductDetailDisplayLogic {
    func displayProductDetail(viewModel: ProductDetail.GetProductDetail.ViewModel)
    func displayErrorAlert()
}

class ProductDetailViewController: UIViewController, ProductDetailDisplayLogic {
    
    @IBOutlet weak var productConditionLabel: UILabel!
    @IBOutlet weak var productTittleLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var productWarrantyLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    var interactor: ProductDetailBusinessLogic?
    var router: (NSObjectProtocol & ProductDetailRoutingLogic & ProductDetailDataPassing)?
    var productId : String?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup(){
        let viewController = self
        let interactor = ProductDetailInteractor()
        let presenter = ProductDetailPresenter()
        let router = ProductDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        getProductDetail()
    }
    
    // MARK: Get product details
    
    func getProductDetail(){
        if let productId = productId {
            let request = ProductDetail.GetProductDetail.Request(productId: productId)
            interactor?.getProductDetail(request: request)
        }
    }
    
    func displayProductDetail(viewModel: ProductDetail.GetProductDetail.ViewModel) {
        let itemViewModel = viewModel.productItemViewModel
                
        productConditionLabel.text = itemViewModel.condition
        productTittleLabel.text = itemViewModel.title
        if let productThumbnail = itemViewModel.thumbnail {
            productImage.sd_setImage(with: URL(string: productThumbnail))
        }
        productPriceLabel.text = itemViewModel.price
        productQuantityLabel.text = itemViewModel.availableQuantity
        productWarrantyLabel.text = itemViewModel.warranty
        productDescriptionLabel.text = itemViewModel.description
    }
    
    func displayErrorAlert() {
        let alert = UIAlertController(title: "Oops!",
                                      message: "Parece que algo no salió bien, por favor intenta de nuevo",
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Volver",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
            self.navigationController?.popViewController(animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Reintentar",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
            self.getProductDetail()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
